/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::cell::RefCell;
use std::collections::VecDeque;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 层序遍历 */
pub fn level_order(root: &Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    // 若根节点为空，则返回空列表
    let Some(root) = root else {
        return Vec::new();
    };

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
    let array = [1, 2, 3, 4, 5, 6, 7];
    let root = TreeLink::try_from_array(array.map(Some)).ok();
    println!("初始化二叉树\n{}", root.display());

    /* 层序遍历 */
    let vec = level_order(&root);
    println!("层序遍历的节点打印序列 = {vec:?}");
}
