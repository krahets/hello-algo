/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* Предварительный обход */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // Порядок обхода: корень -> левое поддерево -> правое поддерево
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
            // Порядок обхода: левое поддерево -> корень -> правое поддерево
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
            // Порядок обхода: левое поддерево -> правое поддерево -> корень
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
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("Инициализация двоичного дерева\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* Предварительный обход */
    let vec = pre_order(root.as_ref());
    println!("\nПоследовательность печати узлов при предварительном обходе = {:?}", vec);

    /* Симметричный обход */
    let vec = in_order(root.as_ref());
    println!("\nПоследовательность печати узлов при симметричном обходе = {:?}", vec);

    /* Обратный обход */
    let vec = post_order(root.as_ref());
    print!("\nПоследовательность печати узлов при обратном обходе = {:?}", vec);
}
