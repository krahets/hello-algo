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

    /* Search for a node */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Stop the search after passing a leaf
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The target is in the right subtree of cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // The target is in the left subtree of cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // The target was found, so exit the loop
                Ordering::Equal => break,
            }
        }

        // Return the target node
        cur
    }

    /* Insert a node */
    pub fn insert(&mut self, num: i32) {
        // If the tree is empty, initialize the root
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Stop the search after passing a leaf
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Return if a duplicate is found
                Ordering::Equal => return,
                // The insertion position is in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The insertion position is in the left subtree of cur
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

    /* Delete a node */
    pub fn remove(&mut self, num: i32) {
        // Return immediately if the tree is empty
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Stop the search after passing a leaf
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The node to delete was found, so exit the loop
                Ordering::Equal => break,
                // The node to delete is in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The node to delete is in the left subtree of cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Return if the node to delete does not exist
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Number of children = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // With no children, child = nullptr. With one child, child is that child.
                let child = left_child.or(right_child);
                // Delete node cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let pre = pre.unwrap();
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // If deleting the root, assign a new root
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
                // Recursively delete node tmp
                self.remove(tmp_val);
                // Replace the value of cur with that of tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* Driver code */
fn main() {
    /* Initialize the binary search tree */
    let mut bst = BinarySearchTree::new();
    // Different insertion orders produce different tree shapes. This sequence produces a perfect binary tree.
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\nInitial binary tree:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Search for a node */
    let node = bst.search(7);
    println!(
        "\nNode found: {:?}, node value = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* Insert a node */
    bst.insert(16);
    println!("\nBinary tree after inserting node 16:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Delete a node */
    bst.remove(1);
    println!("\nBinary tree after deleting node 1:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nBinary tree after deleting node 2:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nBinary tree after deleting node 4:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
