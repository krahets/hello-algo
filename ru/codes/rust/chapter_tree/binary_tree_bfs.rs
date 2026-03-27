/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* Обход в ширину */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // Инициализировать очередь и добавить корневой узел
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // Инициализировать список для хранения последовательности обхода
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // Извлечение из очереди
        vec.push(node.borrow().val); // Сохранить значение узла
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // Поместить левый дочерний узел в очередь
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // Поместить правый дочерний узел в очередь
        };
    }
    vec
}

/* Driver Code */
fn main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("Инициализация двоичного дерева\n");
    print_util::print_tree(&root);

    /* Обход в ширину */
    let vec = level_order(&root);
    print!("\nПоследовательность печати узлов при обходе в ширину = {:?}", vec);
}
