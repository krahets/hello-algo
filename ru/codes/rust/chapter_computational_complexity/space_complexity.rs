/*
 * File: space_complexity.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode, TreeNode};
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

/* Функция */
fn function() -> i32 {
    // Выполнить некоторые операции
    return 0;
}

/* Постоянная сложность */
#[allow(unused)]
fn constant(n: i32) {
    // Константы, переменные и объекты занимают O(1) памяти
    const A: i32 = 0;
    let b = 0;
    let nums = vec![0; 10000];
    let node = ListNode::new(0);
    // Переменные в цикле занимают O(1) памяти
    for i in 0..n {
        let c = 0;
    }
    // Функции в цикле занимают O(1) памяти
    for i in 0..n {
        function();
    }
}

/* Линейная сложность */
#[allow(unused)]
fn linear(n: i32) {
    // Массив длины n занимает O(n) памяти
    let mut nums = vec![0; n as usize];
    // Список длины n занимает O(n) памяти
    let mut nodes = Vec::new();
    for i in 0..n {
        nodes.push(ListNode::new(i))
    }
    // Хеш-таблица длины n занимает O(n) памяти
    let mut map = HashMap::new();
    for i in 0..n {
        map.insert(i, i.to_string());
    }
}

/* Линейная сложность (рекурсивная реализация) */
fn linear_recur(n: i32) {
    println!("Рекурсия n = {}", n);
    if n == 1 {
        return;
    };
    linear_recur(n - 1);
}

/* Квадратичная сложность */
#[allow(unused)]
fn quadratic(n: i32) {
    // Матрица занимает O(n^2) памяти
    let num_matrix = vec![vec![0; n as usize]; n as usize];
    // Двумерный список занимает O(n^2) памяти
    let mut num_list = Vec::new();
    for i in 0..n {
        let mut tmp = Vec::new();
        for j in 0..n {
            tmp.push(0);
        }
        num_list.push(tmp);
    }
}

/* Квадратичная сложность (рекурсивная реализация) */
fn quadratic_recur(n: i32) -> i32 {
    if n <= 0 {
        return 0;
    };
    // Длина массива nums равна n, n-1, ..., 2, 1
    let nums = vec![0; n as usize];
    println!("В рекурсии n = {} , длина nums = {}", n, nums.len());
    return quadratic_recur(n - 1);
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
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
    // Постоянная сложность
    constant(n);
    // Линейная сложность
    linear(n);
    linear_recur(n);
    // Квадратичная сложность
    quadratic(n);
    quadratic_recur(n);
    // Экспоненциальная сложность
    let root = build_tree(n);
    print_util::print_tree(&root.unwrap());
}
