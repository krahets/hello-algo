/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(dead_code)]
#![allow(unused_variables)]

use hello_algo_rust::binary_tree::BinaryTree;
use hello_algo_rust::linked_list::ListNode;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 函数 */
fn function() -> i32 {
    // 执行某些操作
    0
}

/* 常数阶 */
fn constant(n: usize) {
    // 常量、变量、对象占用 O(1) 空间
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // 循环中的变量占用 O(1) 空间
    for _ in 0..n {
        let c = 0;
    }
    // 循环中的函数占用 O(1) 空间
    for _ in 0..n {
        function();
    }
}

/* 线性阶 */
fn linear(n: usize) {
    // 长度为 n 的数组占用 O(n) 空间
    let nums = vec![0; n];
    // 长度为 n 的列表占用 O(n) 空间
    let nodes = (0..n).map(ListNode::new).collect::<Vec<_>>();
    // 长度为 n 的哈希表占用 O(n) 空间
    let map = (0..n)
        .map(|i| (i, i.to_string()))
        .collect::<HashMap<_, _>>();
}

/* 线性阶（递归实现） */
fn linear_recur(n: usize) {
    println!("递归 n = {n}");
    if n == 1 {
        return;
    }
    linear_recur(n - 1);
}

/* 平方阶 */
fn quadratic(n: usize) {
    // 二维列表占用 O(n^2) 空间
    let num_matrix = vec![vec![0; n]; n];
}

/* 平方阶（递归实现） */
fn quadratic_recur(n: usize) -> i32 {
    if n == 0 {
        return 0;
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    let nums = vec![0; n];
    println!("递归 n = {n} 中的 nums 长度 = {n}");
    quadratic_recur(n - 1)
}

/* 指数阶（建立满二叉树） */
fn build_tree(n: usize) -> Option<Rc<RefCell<TreeNode>>> {
    if n == 0 {
        return None;
    }
    let root = TreeNode::new(0);
    root.borrow_mut().left = build_tree(n - 1);
    root.borrow_mut().right = build_tree(n - 1);
    Some(root)
}

/* Driver Code */
fn main() {
    let n = 5;
    // 常数阶
    constant(n);
    // 线性阶
    linear(n);
    linear_recur(n);
    // 平方阶
    quadratic(n);
    quadratic_recur(n);
    // 指数阶
    let root = build_tree(n);
    println!("{}", root.display())
}
