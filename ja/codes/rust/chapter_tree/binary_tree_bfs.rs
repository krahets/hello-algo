/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* レベル順走査 */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // キューを初期化して根を入れる
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // 走査順を記録するリストを初期化する
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // キューの先頭から取り出す
        vec.push(node.borrow().val); // ノードの値を記録する
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // 左の子をキューに入れる
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // 右の子をキューに入れる
        };
    }
    vec
}

/* 実行例 */
fn main() {
    /* 二分木を初期化する */
    // ここでは配列から直接二分木を作る関数を使う
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("二分木を初期化\n");
    print_util::print_tree(&root);

    /* レベル順走査 */
    let vec = level_order(&root);
    print!("\nレベル順に出力したノードの列 = {:?}", vec);
}
