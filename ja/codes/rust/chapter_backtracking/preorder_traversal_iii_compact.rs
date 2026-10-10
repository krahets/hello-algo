/*
 * File: preorder_traversal_iii_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* 前順走査：例題 3 */
fn pre_order(
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    path: &mut Vec<Rc<RefCell<TreeNode>>>,
    root: Option<&Rc<RefCell<TreeNode>>>,
) {
    // 枝刈り
    if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
        return;
    }
    if let Some(node) = root {
        // 試す
        path.push(node.clone());
        if node.borrow().val == 7 {
            // 解を記録
            res.push(path.clone());
        }
        pre_order(res, path, node.borrow().left.as_ref());
        pre_order(res, path, node.borrow().right.as_ref());
        // バックトラック
        path.pop();
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("二分木を初期化");
    print_util::print_tree(root.as_ref().unwrap());

    // 先行順走査
    let mut path = Vec::new();
    let mut res = Vec::new();
    pre_order(&mut res, &mut path, root.as_ref());

    println!("\n根ノードからノード 7 までのすべての経路を出力し、経路には値が 3 のノードを含めない");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
