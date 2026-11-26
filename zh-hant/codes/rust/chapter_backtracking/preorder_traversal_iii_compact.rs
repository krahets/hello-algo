/*
 * File: preorder_traversal_iii_compact.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* 前序走訪：例題三 */
fn pre_order(
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    path: &mut Vec<Rc<RefCell<TreeNode>>>,
    root: Option<&Rc<RefCell<TreeNode>>>,
) {
    // 剪枝
    if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
        return;
    }
    if let Some(node) = root {
        // 嘗試
        path.push(node.clone());
        if node.borrow().val == 7 {
            // 記錄此解
            res.push(path.clone());
        }
        pre_order(res, path, node.borrow().left.as_ref());
        pre_order(res, path, node.borrow().right.as_ref());
        // 回溯
        path.pop();
    }
}

/* 主程式 */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("初始化二元樹");
    print_util::print_tree(root.as_ref().unwrap());

    // 前序走訪
    let mut path = Vec::new();
    let mut res = Vec::new();
    pre_order(&mut res, &mut path, root.as_ref());

    println!("\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不含值為 3 的節點");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}
