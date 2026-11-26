/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* Обход по уровням */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // Создать очередь и добавить корень
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // Создать список для последовательности обхода
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // Извлечь узел из очереди
        vec.push(node.borrow().val); // Сохранить значение узла
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // Добавить левого потомка в очередь
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // Добавить правого потомка в очередь
        };
    }
    vec
}

/* Основная программа */
fn main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("Инициализация двоичного дерева\n");
    print_util::print_tree(&root);

    /* Обход по уровням */
    let vec = level_order(&root);
    print!("\nУзлы в порядке обхода по уровням = {:?}", vec);
}
