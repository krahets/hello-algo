/*
 * File: preorder_traversal_i_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* 前序遍历：例题一 */
fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: Option<&Rc<RefCell<TreeNode>>>) {
    if root.is_none() {
        return;
    }
    if let Some(node) = root {
        if node.borrow().val == 7 {
            // 记录解
            res.push(node.clone());
        }
        pre_order(res, node.borrow().left.as_ref());
        pre_order(res, node.borrow().right.as_ref());
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("初始化二叉树");
    print_util::print_tree(root.as_ref().unwrap());

    // 前序遍历
    let mut res = Vec::new();
    pre_order(&mut res, root.as_ref());

    println!("\n输出所有值为 7 的节点");
    let mut vals = Vec::new();
    for node in res {
        vals.push(node.borrow().val)
    }
    println!("{:?}", vals);
}
