/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* Прямой обход */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Порядок посещения: корень -> левое поддерево -> правое поддерево
            let node = node.borrow();
            res.push(node.val);
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* Симметричный обход */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Порядок посещения: левое поддерево -> корень -> правое поддерево
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            res.push(node.val);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* Обратный обход */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Порядок посещения: левое поддерево -> правое поддерево -> корень
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
            res.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* Основная программа */
fn main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("Инициализация двоичного дерева\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* Прямой обход */
    let vec = pre_order(root.as_ref());
    println!("\nУзлы в порядке прямого обхода = {:?}", vec);

    /* Симметричный обход */
    let vec = in_order(root.as_ref());
    println!("\nУзлы в порядке симметричного обхода = {:?}", vec);

    /* Обратный обход */
    let vec = post_order(root.as_ref());
    print!("\nУзлы в порядке обратного обхода = {:?}", vec);
}
