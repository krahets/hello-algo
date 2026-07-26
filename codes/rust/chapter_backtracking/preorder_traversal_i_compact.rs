/*
 * File: preorder_traversal_i_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::cell::RefCell;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 前序遍历：例题一 */
pub fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: &Option<Rc<RefCell<TreeNode>>>) {
    let Some(node) = root else { return };
    if node.borrow().val == 7 {
        // 记录解
        res.push(node.clone());
    }
    pre_order(res, &node.borrow().left);
    pre_order(res, &node.borrow().right);
}

/* Driver Code */
fn main() {
    let root = TreeLink::try_from_array([1, 7, 3, 4, 5, 6, 7].map(Some)).ok();
    println!("初始化二叉树\n{}", root.display());

    // 前序遍历
    let mut res = Vec::new();
    pre_order(&mut res, &root);

    println!("输出所有值为 7 的节点");
    let vals = res.iter().map(|node| node.borrow().val).collect::<Vec<_>>();
    println!("{vals:?}");
}
