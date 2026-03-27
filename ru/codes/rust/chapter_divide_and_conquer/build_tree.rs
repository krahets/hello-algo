/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};
use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};

/* Построить двоичное дерево: разделяй и властвуй */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // Завершить при пустом диапазоне поддерева
    if r - l < 0 {
        return None;
    }
    // Инициализировать корневой узел
    let root = TreeNode::new(preorder[i as usize]);
    // Найти m, чтобы разделить левое и правое поддеревья
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // Подзадача: построить левое поддерево
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // Подзадача: построить правое поддерево
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // Вернуть корневой узел
    Some(root)
}

/* Построить двоичное дерево */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
    let mut inorder_map: HashMap<i32, i32> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i as i32);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
    root
}

/* Driver Code */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("Предварительный обход = {:?}", preorder);
    println!("Симметричный обход = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("Построенное двоичное дерево:");
    print_util::print_tree(root.as_ref().unwrap());
}
