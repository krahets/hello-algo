/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::binary_tree::{BinaryTree, TreeLink};
use std::cell::RefCell;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 前序遍历 */
pub fn pre_order(root: &Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = Vec::new();

    fn dfs(root: &Option<Rc<RefCell<TreeNode>>>, result: &mut Vec<i32>) {
        if let Some(node) = root {
            // 访问优先级：根节点 -> 左子树 -> 右子树
            let node = node.borrow();
            result.push(node.val);
            dfs(&node.left, result);
            dfs(&node.right, result);
        }
    }

    dfs(root, &mut result);

    result
}

/* 中序遍历 */
pub fn in_order(root: &Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = Vec::new();

    fn dfs(root: &Option<Rc<RefCell<TreeNode>>>, result: &mut Vec<i32>) {
        if let Some(node) = root {
            // 访问优先级：左子树 -> 根节点 -> 右子树
            let node = node.borrow();
            dfs(&node.left, result);
            result.push(node.val);
            dfs(&node.right, result);
        }
    }

    dfs(root, &mut result);

    result
}

/* 后序遍历 */
pub fn post_order(root: &Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = Vec::new();

    fn dfs(root: &Option<Rc<RefCell<TreeNode>>>, result: &mut Vec<i32>) {
        if let Some(node) = root {
            // 访问优先级：左子树 -> 右子树 -> 根节点
            let node = node.borrow();
            dfs(&node.left, result);
            dfs(&node.right, result);
            result.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* Driver Code */
fn main() {
    /* 初始化二叉树 */
    let array = [1, 2, 3, 4, 5, 6, 7];
    let root = TreeLink::try_from_array(array.map(Some)).ok();
    println!("初始化二叉树\n{}", root.display());

    /* 前序遍历 */
    let vec = pre_order(&root);
    println!("前序遍历的节点打印序列 = {vec:?}");

    /* 中序遍历 */
    let vec = in_order(&root);
    println!("中序遍历的节点打印序列 = {vec:?}");

    /* 后序遍历 */
    let vec = post_order(&root);
    println!("后序遍历的节点打印序列 = {vec:?}");
}
