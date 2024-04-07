/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* 层序遍历 */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // 初始化队列，加入根节点
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // 初始化一个列表，用于保存遍历序列
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // 队列出队
        vec.push(node.borrow().val); // 保存节点值
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // 左子节点入队
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // 右子节点入队
        };
    }
    vec
}

/* Driver Code */
fn main() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("初始化二叉树\n");
    print_util::print_tree(&root);

    /* 层序遍历 */
    let vec = level_order(&root);
    print!("\n层序遍历的节点打印序列 = {:?}", vec);
}
