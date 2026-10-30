/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

use hello_algo_rust::include::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* Binary search tree */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* Constructor */
    pub fn new() -> Self {
        // Initialize an empty tree
        Self { root: None }
    }

    /* Get the root of the binary tree */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* Find a node */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The target node lies in the right subtree of cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // The target node lies in the left subtree of cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // The target node was found; exit the loop
                Ordering::Equal => break,
            }
        }

        // Return the matching node, or None if no match was found
        cur
    }

    /* Insert a node */
    pub fn insert(&mut self, num: i32) {
        // If the tree is empty, initialize the root node
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Return immediately if a duplicate node is found
                Ordering::Equal => return,
                // The insertion position lies in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The insertion position lies in the left subtree of cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Insert a node
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* Remove a node */
    pub fn remove(&mut self, num: i32) {
        // Return immediately if the tree is empty
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The node to remove was found; exit the loop
                Ordering::Equal => break,
                // The node to remove lies in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The node to remove lies in the left subtree of cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Return immediately if the node to remove does not exist
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Number of children = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // With 0 or 1 child, child is None or that child, respectively
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Remove node cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // If the removed node is the root, assign the new root
                    self.root = child;
                }
            }
            // Number of children = 2
            (Some(_), Some(_)) => {
                // Get the inorder successor of cur
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // Recursively remove node tmp
                self.remove(tmp_val);
                // Replace the value of cur with the value of tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* Driver code */
fn main() {
    /* Initialize the binary search tree */
    let mut bst = BinarySearchTree::new();
    // Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\nThe initialized binary tree is:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Find a node */
    let node = bst.search(7);
    println!(
        "\nFound node: {:?}, node value = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* Insert a node */
    bst.insert(16);
    println!("\nBinary tree after inserting node 16:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Remove a node */
    bst.remove(1);
    println!("\nBinary tree after removing node 1:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nBinary tree after removing node 2:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nBinary tree after removing node 4:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
