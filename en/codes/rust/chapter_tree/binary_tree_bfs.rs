/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* Level-order traversal */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // Initialize a queue and enqueue the root
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // Initialize a list to store the traversal sequence
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // Dequeue from the queue
        vec.push(node.borrow().val); // Store the node value
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // Enqueue the left child
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // Enqueue the right child
        };
    }
    vec
}

/* Driver code */
fn main() {
    /* Initialize the binary tree */
    // Use a helper function that builds a binary tree directly from an array
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("Initialize the binary tree\n");
    print_util::print_tree(&root);

    /* Level-order traversal */
    let vec = level_order(&root);
    print!("\nNode sequence from level-order traversal = {:?}", vec);
}
