/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* Function */
fn function() -> i32 {
    // Perform some operations
    return 0;
}

/* Constant space */
#[allow(unused)]
fn constant(n: i32) {
    // Constants, variables, and objects use O(1) space
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // Variables in the loop use O(1) space
    for i in 0..n {
        let c = 0;
    }
    // Function calls in the loop use O(1) space
    for i in 0..n {
        function();
    }
}

/* Linear space */
#[allow(unused)]
fn linear(n: i32) {
    // An array of length n uses O(n) space
    let mut nums = vec![0; n as usize];
    // A list of length n uses O(n) space
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // A hash table with n entries uses O(n) space
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* Linear space (recursive) */
fn linear_recur(n: i32) {
    println!("Recursive call: n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* Quadratic space */
#[allow(unused)]
fn quadratic(n: i32) {
    // A matrix uses O(n^2) space
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // A two-dimensional list uses O(n^2) space
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* Quadratic space (recursive) */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // The successive lengths of nums are n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("Recursive call: n = {}, length of nums = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* Exponential space (build a perfect binary tree) */
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
    // Constant space
    constant(n);
    // Linear space
    linear(n);
    linear_recur(n);
    // Quadratic space
    quadratic(n);
    quadratic_recur(n);
    // Exponential space
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
