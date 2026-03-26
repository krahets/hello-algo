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
            // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
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
            // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
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
            // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
            res.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* Driver Code */
fn main() {
    /* Инициализировать двоичное дерево */
    // Здесь используется функция, которая напрямую строит двоичное дерево из массива
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("Инициализировать двоичное дерево\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* Прямой обход */
    let vec = pre_order(root.as_ref());
    println!("\nПоследовательность узлов при прямом обходе = {:?}", vec);

    /* Симметричный обход */
    let vec = in_order(root.as_ref());
    println!("\nПоследовательность узлов при симметричном обходе = {:?}", vec);

    /* Обратный обход */
    let vec = post_order(root.as_ref());
    print!("\nПоследовательность узлов при обратном обходе = {:?}", vec);
}
