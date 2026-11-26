/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* Основная программа */
fn main() {
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // Связать узлы ссылками (указателями)
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    println!("\nИнициализация двоичного дерева\n");
    print_util::print_tree(&n1);

    // Вставка и удаление узлов
    let p = TreeNode::new(0);
    // Вставить узел P между n1 и n2
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    println!("\nПосле вставки узла P:\n");
    print_util::print_tree(&n1);
    // Удалить узел P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    println!("\nПосле удаления узла P:\n");
    print_util::print_tree(&n1);
}
