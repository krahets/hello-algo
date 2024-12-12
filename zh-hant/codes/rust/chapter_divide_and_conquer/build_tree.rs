/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};
use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};

/* 構建二元樹：分治 */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // 子樹區間為空時終止
    if r - l < 0 {
        return None;
    }
    // 初始化根節點
    let root = TreeNode::new(preorder[i as usize]);
    // 查詢 m ，從而劃分左右子樹
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // 子問題：構建左子樹
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // 子問題：構建右子樹
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // 返回根節點
    Some(root)
}

/* 構建二元樹 */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    println!("中序走訪 = {:?}", preorder);
    println!("前序走訪 = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("構建的二元樹為：");
    print_util::print_tree(root.as_ref().unwrap());
}
