/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* 先行順走査 */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 訪問順序：根ノード -> 左部分木 -> 右部分木
            let node = node.borrow();
            res.push(node.val);
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 中順走査 */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            res.push(node.val);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 後順走査 */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
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
    /* 二分木を初期化 */
    // ここでは、配列から直接二分木を生成する関数を利用する
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("二分木を初期化\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* 先行順走査 */
    let vec = pre_order(root.as_ref());
    println!("\n前順走査のノード出力シーケンス = {:?}", vec);

    /* 中順走査 */
    let vec = in_order(root.as_ref());
    println!("\n中順走査のノード出力シーケンス = {:?}", vec);

    /* 後順走査 */
    let vec = post_order(root.as_ref());
    print!("\n後順走査のノード出力シーケンス = {:?}", vec);
}
