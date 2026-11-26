/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* 前序走訪 */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 走訪順序：根節點 -> 左子樹 -> 右子樹
            let node = node.borrow();
            res.push(node.val);
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 中序走訪 */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 走訪順序：左子樹 -> 根節點 -> 右子樹
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            res.push(node.val);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 後序走訪 */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 走訪順序：左子樹 -> 右子樹 -> 根節點
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
            res.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* 主程式 */
fn main() {
    /* 初始化二元樹 */
    // 這裡使用能從陣列直接建立二元樹的函式
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("初始化二元樹\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* 前序走訪 */
    let vec = pre_order(root.as_ref());
    println!("\n依前序走訪印出的節點序列 = {:?}", vec);

    /* 中序走訪 */
    let vec = in_order(root.as_ref());
    println!("\n依中序走訪印出的節點序列 = {:?}", vec);

    /* 後序走訪 */
    let vec = post_order(root.as_ref());
    print!("\n依後序走訪印出的節點序列 = {:?}", vec);
}
