/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 函式 */
fn function() -> i32 {
    // 執行某些操作
    return 0;
}

/* 常數階 */
#[allow(unused)]
fn constant(n: i32) {
    // 常數、變數、物件佔用 O(1) 空間
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // 迴圈中的變數佔用 O(1) 空間
    for i in 0..n {
        let c = 0;
    }
    // 迴圈中的函式佔用 O(1) 空間
    for i in 0..n {
        function();
    }
}

/* 線性階 */
#[allow(unused)]
fn linear(n: i32) {
    // 長度為 n 的陣列佔用 O(n) 空間
    let mut nums = vec![0; n as usize];
    // 長度為 n 的串列佔用 O(n) 空間
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // 長度為 n 的雜湊表佔用 O(n) 空間
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* 線性階（遞迴實現） */
fn linear_recur(n: i32) {
    println!("遞迴 n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* 平方階 */
#[allow(unused)]
fn quadratic(n: i32) {
    // 矩陣佔用 O(n^2) 空間
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 二維串列佔用 O(n^2) 空間
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* 平方階（遞迴實現） */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // 陣列 nums 長度為 n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("遞迴 n = {} 中的 nums 長度 = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* 指數階（建立滿二元樹） */
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
    // 常數階
    constant(n);
    // 線性階
    linear(n);
    linear_recur(n);
    // 平方階
    quadratic(n);
    quadratic_recur(n);
    // 指數階
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
