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

/* 定数オーダー */
#[allow(unused)]
fn constant(n: i32) {
    // 定数・変数・オブジェクトが使う領域は O(1)
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // ループ内の変数が使う領域は O(1)
    for i in 0..n {
        let c = 0;
    }
    // ループ内の関数が使う領域は O(1)
    for i in 0..n {
        function();
    }
}

/* 線形オーダー */
#[allow(unused)]
fn linear(n: i32) {
    // 長さ n の配列が使う領域は O(n)
    let mut nums = vec![0; n as usize];
    // 長さ n のリストが使う領域は O(n)
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // 長さ n のハッシュテーブルが使う領域は O(n)
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* 線形オーダー（再帰による実装） */
fn linear_recur(n: i32) {
    println!("再帰 n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* 二次オーダー */
#[allow(unused)]
fn quadratic(n: i32) {
    // 行列が使う領域は O(n^2)
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 二次元リストが使う領域は O(n^2)
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* 二次オーダー（再帰による実装） */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // 配列 nums の長さは順に n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("再帰 n = {} での nums の長さ = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* 指数オーダー（すべての葉が同じ深さの完全二分木を構築） */
fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
    if n == 0 {
        return None;
    };
    let root = TreeNode::new(0);
    root.borrow_mut().left = build_tree(n - 1);
    root.borrow_mut().right = build_tree(n - 1);
    return Some(root);
}

/* 実行例 */
fn main() {
    let n = 5;
    // 定数オーダー
    constant(n);
    // 線形オーダー
    linear(n);
    linear_recur(n);
    // 二次オーダー
    quadratic(n);
    quadratic_recur(n);
    // 指数オーダー
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
