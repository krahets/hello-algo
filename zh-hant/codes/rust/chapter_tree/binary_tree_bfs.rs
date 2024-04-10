/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* 層序走訪 */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // 初始化佇列，加入根節點
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // 初始化一個串列，用於儲存走訪序列
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // 隊列出隊
        vec.push(node.borrow().val); // 儲存節點值
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // 左子節點入列
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // 右子節點入列
        };
    }
    vec
}

/* Driver Code */
fn main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("初始化二元樹\n");
    print_util::print_tree(&root);

    /* 層序走訪 */
    let vec = level_order(&root);
    print!("\n層序走訪的節點列印序列 = {:?}", vec);
}
