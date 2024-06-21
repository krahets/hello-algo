/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::rc::Rc;
use tree_node::{vec_to_tree, TreeNode};

/* 前序走訪 */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        result.push(node.borrow().val);
        result.extend(pre_order(node.borrow().left.as_ref()));
        result.extend(pre_order(node.borrow().right.as_ref()));
    }
    result
}

/* 中序走訪 */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        result.extend(in_order(node.borrow().left.as_ref()));
        result.push(node.borrow().val);
        result.extend(in_order(node.borrow().right.as_ref()));
    }
    result
}

/* 後序走訪 */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        result.extend(post_order(node.borrow().left.as_ref()));
        result.extend(post_order(node.borrow().right.as_ref()));
        result.push(node.borrow().val);
    }
    result
}

/* Driver Code */
fn main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("初始化二元樹\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* 前序走訪 */
    let vec = pre_order(root.as_ref());
    println!("\n前序走訪的節點列印序列 = {:?}", vec);

    /* 中序走訪 */
    let vec = in_order(root.as_ref());
    println!("\n中序走訪的節點列印序列 = {:?}", vec);

    /* 後序走訪 */
    let vec = post_order(root.as_ref());
    print!("\n後序走訪的節點列印序列 = {:?}", vec);
}
