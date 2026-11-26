/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* 함수 */
fn function() -> i32 {
    // 어떤 연산을 수행한다
    return 0;
}

/* 상수 차수 */
#[allow(unused)]
fn constant(n: i32) {
    // 상수, 변수, 객체가 O(1)의 공간을 차지한다
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // 반복문 안의 변수가 O(1)의 공간을 차지한다
    for i in 0..n {
        let c = 0;
    }
    // 반복문 안의 함수가 O(1)의 공간을 차지한다
    for i in 0..n {
        function();
    }
}

/* 선형 차수 */
#[allow(unused)]
fn linear(n: i32) {
    // 길이 n인 배열이 O(n)의 공간을 차지한다
    let mut nums = vec![0; n as usize];
    // 길이 n인 리스트가 O(n)의 공간을 차지한다
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* 선형 차수(재귀 구현) */
fn linear_recur(n: i32) {
    println!("재귀 호출 n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* 이차 차수 */
#[allow(unused)]
fn quadratic(n: i32) {
    // 행렬이 O(n^2)의 공간을 차지한다
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // 2차원 리스트가 O(n^2)의 공간을 차지한다
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* 이차 차수(재귀 구현) */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // 배열 nums의 길이는 차례로 n, n-1, ..., 2, 1이다
    let nums = vec![0; n as usize];
    println!("재귀 호출 n = {}에서 nums의 길이 = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* 지수 차수(포화 이진 트리 생성) */
fn build_tree(n: i32) -> Option<Rc<RefCell<TreeNode>>> {
    if n == 0 {
        return None;
    };
    let root = TreeNode::new(0);
    root.borrow_mut().left = build_tree(n - 1);
    root.borrow_mut().right = build_tree(n - 1);
    return Some(root);
}

/* 실행 예제 */
fn main() {
    let n = 5;
    // 상수 차수
    constant(n);
    // 선형 차수
    linear(n);
    linear_recur(n);
    // 이차 차수
    quadratic(n);
    quadratic_recur(n);
    // 지수 차수
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
