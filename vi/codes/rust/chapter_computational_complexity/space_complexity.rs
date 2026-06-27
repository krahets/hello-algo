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

/* Constant order */
#[allow(unused)]
fn constant(n: i32) {
    // Constants, variables, objects occupy O(1) space
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // Variables in the loop occupy O(1) space
    for i in 0..n {
        let c = 0;
    }
    // Functions in the loop occupy O(1) space
    for i in 0..n {
        function();
    }
}

/* Linear order */
#[allow(unused)]
fn linear(n: i32) {
    // Array of length n uses O(n) space
    let mut nums = vec![0; n as usize];
    // A list of length n occupies O(n) space
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // A hash table of length n occupies O(n) space
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* Linear order (recursive implementation) */
fn linear_recur(n: i32) {
    println!("Recursion n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* Exponential order */
#[allow(unused)]
fn quadratic(n: i32) {
    // Matrix uses O(n^2) space
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 2D list uses O(n^2) space
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* Quadratic order (recursive implementation) */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // Array nums has length n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("In recursion n = {}, nums length = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* Driver Code */
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
    // Constant order
    constant(n);
    // Linear order
    linear(n);
    linear_recur(n);
    // Exponential order
    quadratic(n);
    quadratic_recur(n);
    // Exponential order
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
