/*
 * File: preorder_traversal_iii_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::cell::RefCell;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 前序遍历：例题三 */
pub fn pre_order(
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    path: &mut Vec<Rc<RefCell<TreeNode>>>,
    root: &Option<Rc<RefCell<TreeNode>>>,
) {
    // 剪枝
    let Some(node) = root else { return };
    if node.borrow().val == 3 {
        return;
    }
    // 尝试
    path.push(node.clone());
    if node.borrow().val == 7 {
        // 记录解
        res.push(path.clone());
    }
    pre_order(res, path, &node.borrow().left);
    pre_order(res, path, &node.borrow().right);
    // 回退
    path.pop();
}

/* Driver Code */
fn main() {
    let root = TreeLink::try_from_array([1, 7, 3, 4, 5, 6, 7].map(Some)).ok();
    println!("初始化二叉树\n{}", root.display());

    // 前序遍历
    let mut path = Vec::new();
    let mut res = Vec::new();
    pre_order(&mut res, &mut path, &root);

    println!("输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点");
    for path in res {
        let vals = path
            .iter()
            .map(|node| node.borrow().val)
            .collect::<Vec<_>>();
        println!("{vals:?}");
    }
}
