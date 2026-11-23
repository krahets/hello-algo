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

    /* Get the node height */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // A null node has height -1; a leaf has height 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Update the node height */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // The node height equals the height of its taller subtree + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* Get the balance factor */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // A null node has balance factor 0
            None => 0,
            // Node balance factor = left subtree height - right subtree height
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* Right rotation */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Rotate node to the right around child
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Update the node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return the root of the rotated subtree
                Some(child)
            }
            None => None,
        }
    }

    /* Left rotation */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Rotate node to the left around child
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Update the node height
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Return the root of the rotated subtree
                Some(child)
            }
            None => None,
        }
    }

    /* Perform rotations to restore balance in this subtree */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Get the balance factor of node
        let balance_factor = Self::balance_factor(node.clone());
        // Left-heavy tree
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Rotate right
                Self::right_rotate(Some(node))
            } else {
                // Rotate left, then right
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Right-heavy tree
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Rotate left
                Self::left_rotate(Some(node))
            } else {
                // Rotate right, then left
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // The tree is balanced; return without rotating
            node
        }
    }

    /* Insert a node */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Insert a node recursively (helper method) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find the insertion position and insert the node */
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
                        return Some(node); // Return without inserting a duplicate node
                    }
                }
                Self::update_height(Some(node.clone())); // Update the node height

                /* 2. Perform rotations to restore balance in this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return the root of the subtree
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* Remove a node */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Remove a node recursively (helper method) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Find and remove the node */
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
                        // Number of children = 0: remove node and return
                        None => {
                            return None;
                        }
                        // Number of children = 1: remove node directly
                        Some(child) => node = child,
                    }
                } else {
                    // Number of children = 2: remove the inorder successor and use its value to replace the current node value
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
                Self::update_height(Some(node.clone())); // Update the node height

                /* 2. Perform rotations to restore balance in this subtree */
                node = Self::rotate(Some(node)).unwrap();
                // Return the root of the subtree
                Some(node)
            }
            None => None,
        }
    }

    /* Find a node */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Search while cur refers to a node
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // The target node lies in the right subtree of cur
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // The target node lies in the left subtree of cur
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // The target node was found; exit the loop
                Ordering::Equal => {
                    break;
                }
            }
        }
        // Return the matching node, or None if no match was found
        cur
    }
}

/* Driver code */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\nAVL tree after inserting node {}:", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\nAVL tree after removing node {}:", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* Initialize an empty AVL tree */
    let mut avl_tree = AVLTree::new();

    /* Insert a node */
    // Observe how the AVL tree maintains balance after a node is inserted
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

    /* Insert a duplicate node */
    test_insert(&mut avl_tree, 7);

    /* Remove a node */
    // Observe how the AVL tree maintains balance after a node is removed
    test_remove(&mut avl_tree, 8); // Remove a node with 0 children
    test_remove(&mut avl_tree, 5); // Remove a node with 1 child
    test_remove(&mut avl_tree, 4); // Remove a node with 2 children

    /* Look up a node */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\nFound node: {:?}, node value = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}
