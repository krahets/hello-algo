/*
 * File: avl_tree.rs
 * Created Time: 2023-07-14
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* AVL tree */
struct AVLTree {
    root: OptionTreeNodeRc, // Root node
}

impl AVLTree {
    /* Constructor */
    fn new() -> Self {
        Self { root: None }
    }

    /* Get node height */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // Empty node height is -1, leaf node height is 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Update node height */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // Node height equals the height of the tallest subtree + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* Get balance factor */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // Empty node balance factor is 0
            None => 0,
            // Node balance factor = left subtree height - right subtree height
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* Right rotation operation */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Using child as pivot, rotate node to the right
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Update node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return root node of subtree after rotation
                Some(child)
            }
            None => None,
        }
    }

    /* Left rotation operation */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Using child as pivot, rotate node to the left
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Update node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return root node of subtree after rotation
                Some(child)
            }
            None => None,
        }
    }

    /* Perform rotation operation to restore balance to this subtree */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Get balance factor of node
        let balance_factor = Self::balance_factor(node.clone());
        // Left-leaning tree
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Right rotation
                Self::right_rotate(Some(node))
            } else {
                // First left rotation then right rotation
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Right-leaning tree
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Left rotation
                Self::left_rotate(Some(node))
            } else {
                // First right rotation then left rotation
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // Balanced tree, no rotation needed, return directly
            node
        }
    }

    /* Insert node */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Recursively insert node (helper method) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find insertion position and insert node */
                match {
                    let node_val = node.borrow().val;
                    node_val
                }
                .cmp(&val)
                {
                    Ordering::Greater => {
                        let left = node.borrow().left.clone();
                        node.borrow_mut().left = Self::insert_helper(left, val);
                    }
                    Ordering::Less => {
                        let right = node.borrow().right.clone();
                        node.borrow_mut().right = Self::insert_helper(right, val);
                    }
                    Ordering::Equal => {
                        return Some(node); // Duplicate node not inserted, return directly
                    }
                }
                Self::update_height(Some(node.clone())); // Update node height

                /* 2. Perform rotation operation to restore balance to this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return root node of subtree
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* Remove node */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Recursively delete node (helper method) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find node and delete */
                if val < node.borrow().val {
                    let left = node.borrow().left.clone();
                    node.borrow_mut().left = Self::remove_helper(left, val);
                } else if val > node.borrow().val {
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, val);
                } else if node.borrow().left.is_none() || node.borrow().right.is_none() {
                    let child = if node.borrow().left.is_some() {
                        node.borrow().left.clone()
                    } else {
                        node.borrow().right.clone()
                    };
                    match child {
                        // Number of child nodes = 0, delete node directly and return
                        None => {
                            return None;
                        }
                        // Number of child nodes = 1, delete node directly
                        Some(child) => node = child,
                    }
                } else {
                    // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                    let mut temp = node.borrow().right.clone().unwrap();
                    loop {
                        let temp_left = temp.borrow().left.clone();
                        if temp_left.is_none() {
                            break;
                        }
                        temp = temp_left.unwrap();
                    }
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
                Self::update_height(Some(node.clone())); // Update node height

                /* 2. Perform rotation operation to restore balance to this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return root node of subtree
                Some(node)
            }
            None => None,
        }
    }

    /* Search node */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Loop search, exit after passing leaf node
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // Target node is in cur's right subtree
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // Target node is in cur's left subtree
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // Found target node, exit loop
                Ordering::Equal => {
                    break;
                }
            }
        }
        // Return target node
        cur
    }
}

/* Driver Code */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\nAfter inserting node {}, AVL tree is", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\nAfter deleting node {}, AVL tree is", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* Please pay attention to how the AVL tree maintains balance after inserting nodes */
    let mut avl_tree = AVLTree::new();

    /* Insert node */
    // Delete nodes
    test_insert(&mut avl_tree, 1);
    test_insert(&mut avl_tree, 2);
    test_insert(&mut avl_tree, 3);
    test_insert(&mut avl_tree, 4);
    test_insert(&mut avl_tree, 5);
    test_insert(&mut avl_tree, 8);
    test_insert(&mut avl_tree, 7);
    test_insert(&mut avl_tree, 9);
    test_insert(&mut avl_tree, 10);
    test_insert(&mut avl_tree, 6);

    /* Please pay attention to how the AVL tree maintains balance after deleting nodes */
    test_insert(&mut avl_tree, 7);

    /* Remove node */
    // Delete node with degree 1
    test_remove(&mut avl_tree, 8); // Delete node with degree 2
    test_remove(&mut avl_tree, 5); // Remove node with degree 1
    test_remove(&mut avl_tree, 4); // Remove node with degree 2

    /* Search node */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\nFound node object is {:?}, node value = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
