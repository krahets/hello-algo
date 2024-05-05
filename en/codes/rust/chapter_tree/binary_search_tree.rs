/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

use tree_node::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* Binary search tree */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* Constructor */
    pub fn new() -> Self {
        // Initialize empty tree
        Self { root: None }
    }

    /* Get binary tree root node */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* Search node */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Loop find, break after passing leaf nodes
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Target node is in cur's right subtree
                Ordering::Greater => cur = node.borrow().right.clone(),
                // Target node is in cur's left subtree
                Ordering::Less => cur = node.borrow().left.clone(),
                // Found target node, break loop
                Ordering::Equal => break,
            }
        }

        // Return target node
        cur
    }

    /* Insert node */
    pub fn insert(&mut self, num: i32) {
        // If tree is empty, initialize root node
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Loop find, break after passing leaf nodes
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Found duplicate node, thus return
                Ordering::Equal => return,
                // Insertion position is in cur's right subtree
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Insertion position is in cur's left subtree
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Insert node
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* Remove node */
    pub fn remove(&mut self, num: i32) {
        // If tree is empty, return
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Loop find, break after passing leaf nodes
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Found node to be removed, break loop
                Ordering::Equal => break,
                // Node to be removed is in cur's right subtree
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Node to be removed is in cur's left subtree
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // If no node to be removed, return
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Number of child nodes = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // When the number of child nodes = 0 / 1, child = nullptr / that child node
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Remove node cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(&left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // If the removed node is the root, reassign the root
                    self.root = child;
                }
            }
            // Number of child nodes = 2
            (Some(_), Some(_)) => {
                // Get the next node in in-order traversal of cur
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmpval = tmp.unwrap().borrow().val;
                // Recursively remove node tmp
                self.remove(tmpval);
                // Replace cur with tmp
                cur.borrow_mut().val = tmpval;
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* Initialize binary search tree */
    let mut bst = BinarySearchTree::new();
    // Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\nInitialized binary tree is\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Search node */
    let node = bst.search(7);
    println!(
        "\nThe found node object is {:?}, node value = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* Insert node */
    bst.insert(16);
    println!("\nAfter inserting node 16, the binary tree is\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* Remove node */
    bst.remove(1);
    println!("\nAfter removing node 1, the binary tree is\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\nAfter removing node 2, the binary tree is\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\nAfter removing node 4, the binary tree is\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}
