/*
 * File: preorder_traversal_iii_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* Pre-order traversal: Example three */
fn pre_order(
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    path: &mut Vec<Rc<RefCell<TreeNode>>>,
    root: Option<Rc<RefCell<TreeNode>>>,
) {
    // Pruning
    if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
        return;
    }
    if let Some(node) = root {
        // Attempt
        path.push(node.clone());
        if node.borrow().val == 7 {
            // Record solution
            res.push(path.clone());
        }
        pre_order(res, path, node.borrow().left.clone());
        pre_order(res, path, node.borrow().right.clone());
        // Retract
        path.remove(path.len() - 1);
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Initialize binary tree");
    print_util::print_tree(root.as_ref().unwrap());

    // Pre-order traversal
    let mut path = Vec::new();
    let mut res = Vec::new();
    pre_order(&mut res, &mut path, root);

    println!("\nOutput all root-to-node 7 paths, not including nodes with value 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
