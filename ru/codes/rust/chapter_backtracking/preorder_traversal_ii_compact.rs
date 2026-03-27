/*
 * File: preorder_traversal_ii_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* Предварительный обход: пример 2 */
fn pre_order(
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    path: &mut Vec<Rc<RefCell<TreeNode>>>,
    root: Option<&Rc<RefCell<TreeNode>>>,
) {
    if root.is_none() {
        return;
    }
    if let Some(node) = root {
        // Попытка
        path.push(node.clone());
        if node.borrow().val == 7 {
            // Записать решение
            res.push(path.clone());
        }
        pre_order(res, path, node.borrow().left.as_ref());
        pre_order(res, path, node.borrow().right.as_ref());
        // Откат
        path.pop();
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Инициализация двоичного дерева");
    print_util::print_tree(root.as_ref().unwrap());

    // Предварительный обход
    let mut path = Vec::new();
    let mut res = Vec::new();
    pre_order(&mut res, &mut path, root.as_ref());

    println!("\nВсе пути от корня к узлу 7");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
