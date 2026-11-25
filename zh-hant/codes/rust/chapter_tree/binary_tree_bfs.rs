/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* 層序走訪 */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // 初始化佇列並加入根節點
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // 初始化一個串列，用來儲存走訪序列
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // 從佇列前端取出節點
        vec.push(node.borrow().val); // 儲存節點值
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // 將左子節點加入佇列
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // 將右子節點加入佇列
        };
    }
    vec
}

/* 主程式 */
fn main() {
    /* 初始化二元樹 */
    // 這裡使用能從陣列直接建立二元樹的函式
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("初始化二元樹\n");
    print_util::print_tree(&root);

    /* 層序走訪 */
    let vec = level_order(&root);
    print!("\n依層序走訪印出的節點序列 = {:?}", vec);
}
