/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* Preorder traversal */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Visit priority: root node -> left subtree -> right subtree
            let node = node.borrow();
            res.push(node.val);
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* Inorder traversal */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Visit priority: left subtree -> root node -> right subtree
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            res.push(node.val);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* Postorder traversal */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Visit priority: left subtree -> right subtree -> root node
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
            res.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* Driver Code */
fn main() {
    /* Initialize binary tree */
    // Here we use a function to generate a binary tree directly from an array
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("Initialize binary tree\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* Preorder traversal */
    let vec = pre_order(root.as_ref());
    println!("\nPre-order traversal node sequence = {:?}", vec);

    /* Inorder traversal */
    let vec = in_order(root.as_ref());
    println!("\nIn-order traversal node sequence = {:?}", vec);

    /* Postorder traversal */
    let vec = post_order(root.as_ref());
    print!("\nPost-order traversal node sequence = {:?}", vec);
}
