/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 関数 */
fn function() -> i32 {
    // 何らかの処理を行う
    return 0;
}

/* 定数階 */
#[allow(unused)]
fn constant(n: i32) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // ループ内の変数は O(1) の空間を占める
    for i in 0..n {
        let c = 0;
    }
    // ループ内の関数は O(1) の空間を占める
    for i in 0..n {
        function();
    }
}

/* 線形階 */
#[allow(unused)]
fn linear(n: i32) {
    // 長さ n の配列は O(n) の空間を使用
    let mut nums = vec![0; n as usize];
    // 長さ n のリストは O(n) の空間を使用
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* 線形時間（再帰実装） */
fn linear_recur(n: i32) {
    println!("再帰 n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* 二乗階 */
#[allow(unused)]
fn quadratic(n: i32) {
    // 行列は O(n^2) の空間を使用する
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 二次元リストは O(n^2) の空間を使用
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* 二次時間（再帰実装） */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // 配列 nums の長さは n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("再帰 n = {} における nums の長さ = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* 指数時間（完全二分木の構築） */
fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
    if n == 0 {
        return None;
    };
    let root = TreeNode::new(0);
    root.borrow_mut().left = build_tree(n - 1);
    root.borrow_mut().right = build_tree(n - 1);
    return Some(root);
}

/* Driver Code */
fn main() {
    let n = 5;
    // 定数階
    constant(n);
    // 線形階
    linear(n);
    linear_recur(n);
    // 二乗階
    quadratic(n);
    quadratic_recur(n);
    // 指数オーダー
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
