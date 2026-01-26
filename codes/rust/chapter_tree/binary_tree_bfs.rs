/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeNode};
use std::cell::RefCell;
use std::collections::VecDeque;
use std::rc::Rc;

/* 层序遍历 */
pub fn level_order(root: &Rc<RefCell<TreeNode<i32>>>) -> Vec<i32> {
    // 初始化队列，加入根节点
    let mut que = VecDeque::new();
    que.push_back(Rc::clone(root));
    // 初始化一个列表，用于保存遍历序列
    let mut vec = Vec::new();

    // 队列出队
    while let Some(node) = que.pop_front() {
        // 保存节点值
        vec.push(node.borrow().val);
        if let Some(left) = &node.borrow().left {
            // 左子节点入队
            que.push_back(Rc::clone(left));
        }
        if let Some(right) = &node.borrow().right {
            // 右子节点入队
            que.push_back(Rc::clone(right));
        };
    }

    vec
}

/* Driver Code */
fn main() {
    /* 初始化二叉树 */
    let array = [
        Some(1),
        Some(2),
        Some(3),
        Some(4),
        Some(5),
        Some(6),
        Some(7),
    ];
    let root = Rc::<RefCell<TreeNode<i32>>>::try_from_array(array).ok();
    println!("初始化二叉树\n{}", root.display());

    /* 层序遍历 */
    let vec = level_order(root.as_ref().unwrap());
    println!("层序遍历的节点打印序列 = {vec:?}");
}
