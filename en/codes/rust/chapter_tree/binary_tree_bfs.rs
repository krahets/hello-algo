/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* Level-order traversal */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // Initialize queue, add root node
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // Initialize a list to store the traversal sequence
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // Queue dequeues
        vec.push(node.borrow().val); // Save node value
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // Left child node enqueues
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // Right child node enqueues
        };
    }
    vec
}

/* Driver Code */
fn main() {
    /* Initialize binary tree */
    // Use a specific function to convert an array into a binary tree
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("Initialize binary tree\n");
    print_util::print_tree(&root);

    /* Level-order traversal */
    let vec = level_order(&root);
    print!("\nPrint sequence of nodes in level-order traversal = {:?}", vec);
}
