#![allow(unused_variables)]
/**
 * File: space_complexity.cpp
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com )
*/

use std::collections::HashMap;

/* 函数 */
fn func() {
    // do something
}

/* 常数阶 */
fn constant(n: i32) {
    // TODO
}

/* 线性阶 */
fn linear(n: i32) {
    // 长度为 n 的数组占用 O(n) 空间
    let nums = vec![0; n as usize];
    // 长度为 n 的列表占用 O(n) 空间
    // TODO
    // 长度为 n 的哈希表占用 O(n) 空间
    let map: HashMap<_, _> = (0..n).map(|i| (i, format!("{}", i))).collect();
}

/* 线性阶（递归实现） */
fn linear_recur(n: i32) {
    println!("递归 n = {n}");
    if n == 1 {
        return;
    }
    linear_recur(n - 1);
}

/* 平方阶 */
fn quadratic(n: i32) {
    // 二维列表占用 O(n^2) 空间
    let num_matrix = vec![vec![0; n as usize]; n as usize];
}

/* 平方阶（递归实现） */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("递归 n = {n} 中的 nums 长度 = {}", nums.len());
    return quadratic_recur(n - 1);
}

fn build_tree(n: usize) {
    // TODO
}

fn main() {
   let n = 5;
    /* 常数阶 */
    constant(n);
    /* 线性阶 */
    linear(n);
    linear_recur(n);
    /* 平方阶 */
    quadratic(n);
    quadratic_recur(n);
    /* 指数阶 */
    // let root = build_tree(n);
    // print_tree(root);
}