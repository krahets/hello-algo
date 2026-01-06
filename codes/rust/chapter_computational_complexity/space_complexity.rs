/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 函数 */
fn function() -> i32 {
    // 执行某些操作
    return 0;
}

/* 常数阶 */
#[allow(unused)]
fn constant(n: i32) {
    // 常量、变量、对象占用 O(1) 空间
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // 循环中的变量占用 O(1) 空间
    for i in 0..n {
        let c = 0;
    }
    // 循环中的函数占用 O(1) 空间
    for i in 0..n {
        function();
    }
}

/* 线性阶 */
#[allow(unused)]
fn linear(n: i32) {
    // 长度为 n 的数组占用 O(n) 空间
    let mut nums = vec![0; n as usize];
    // 长度为 n 的列表占用 O(n) 空间
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* 线性阶（递归实现） */
fn linear_recur(n: i32) {
    println!("递归 n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* 平方阶 */
#[allow(unused)]
fn quadratic(n: i32) {
    // 矩阵占用 O(n^2) 空间
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 二维列表占用 O(n^2) 空间
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* 平方阶（递归实现） */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("递归 n = {} 中的 nums 长度 = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* 指数阶（建立满二叉树） */
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
    print_util::print_tree(&root.unwrap());
}
