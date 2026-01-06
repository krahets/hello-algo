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
            // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
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
            // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
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
            // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
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
