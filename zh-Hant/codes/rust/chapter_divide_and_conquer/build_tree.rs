/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};
include!("../include/include.rs");
use tree_node::TreeNode;

/* 构建二叉树：分治 */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // 子树区间为空时终止
    if r - l < 0 {
        return None;
    }
    // 初始化根节点
    let root = TreeNode::new(preorder[i as usize]);
    // 查询 m ，从而划分左右子树
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // 子问题：构建左子树
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // 子问题：构建右子树
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // 返回根节点
    Some(root)
}

/* 构建二叉树 */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // 初始化哈希表，存储 inorder 元素到索引的映射
    let mut inorder_map: HashMap<i32, i32> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i as i32);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
    root
}

/* Driver Code */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("中序遍历 = {:?}", preorder);
    println!("前序遍历 = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("构建的二叉树为：");
    print_util::print_tree(root.as_ref().unwrap());
}
