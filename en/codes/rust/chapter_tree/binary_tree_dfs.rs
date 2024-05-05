/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::rc::Rc;
use tree_node::{vec_to_tree, TreeNode};

/* Pre-order traversal */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // Visit priority: root node -> left subtree -> right subtree
        result.push(node.borrow().val);
        result.extend(pre_order(node.borrow().left.as_ref()));
        result.extend(pre_order(node.borrow().right.as_ref()));
    }
    result
}

/* In-order traversal */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // Visit priority: left subtree -> root node -> right subtree
        result.extend(in_order(node.borrow().left.as_ref()));
        result.push(node.borrow().val);
        result.extend(in_order(node.borrow().right.as_ref()));
    }
    result
}

/* Post-order traversal */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // Visit priority: left subtree -> right subtree -> root node
        result.extend(post_order(node.borrow().left.as_ref()));
        result.extend(post_order(node.borrow().right.as_ref()));
        result.push(node.borrow().val);
    }
    result
}

/* Driver Code */
fn main() {
    /* Initialize binary tree */
    // Use a specific function to convert an array into a binary tree
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("Initialize binary tree\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* Pre-order traversal */
    let vec = pre_order(root.as_ref());
    println!("\nPrint sequence of nodes in pre-order traversal = {:?}", vec);

    /* In-order traversal */
    let vec = in_order(root.as_ref());
    println!("\nPrint sequence of nodes in in-order traversal = {:?}", vec);

    /* Post-order traversal */
    let vec = post_order(root.as_ref());
    print!("\nPrint sequence of nodes in post-order traversal = {:?}", vec);
}
