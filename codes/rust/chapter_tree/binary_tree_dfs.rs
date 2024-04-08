/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::rc::Rc;
use tree_node::{vec_to_tree, TreeNode};

/* 前序遍历 */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 访问优先级：根节点 -> 左子树 -> 右子树
        result.push(node.borrow().val);
        result.extend(pre_order(node.borrow().left.as_ref()));
        result.extend(pre_order(node.borrow().right.as_ref()));
    }
    result
}

/* 中序遍历 */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 访问优先级：左子树 -> 根节点 -> 右子树
        result.extend(in_order(node.borrow().left.as_ref()));
        result.push(node.borrow().val);
        result.extend(in_order(node.borrow().right.as_ref()));
    }
    result
}

/* 后序遍历 */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    if let Some(node) = root {
        // 访问优先级：左子树 -> 右子树 -> 根节点
        result.extend(post_order(node.borrow().left.as_ref()));
        result.extend(post_order(node.borrow().right.as_ref()));
        result.push(node.borrow().val);
    }
    result
}

/* Driver Code */
fn main() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("初始化二叉树\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* 前序遍历 */
    let vec = pre_order(root.as_ref());
    println!("\n前序遍历的节点打印序列 = {:?}", vec);

    /* 中序遍历 */
    let vec = in_order(root.as_ref());
    println!("\n中序遍历的节点打印序列 = {:?}", vec);

    /* 后序遍历 */
    let vec = post_order(root.as_ref());
    print!("\n后序遍历的节点打印序列 = {:?}", vec);
}
