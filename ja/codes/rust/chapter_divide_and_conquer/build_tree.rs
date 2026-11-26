/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};
use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};

/* 二分木の構築：分割統治法 */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // 部分木の区間が空なら終了する
    if r - l < 0 {
        return None;
    }
    // 根ノードを初期化する
    let root = TreeNode::new(preorder[i as usize]);
    // m を調べて左右の部分木を分ける
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // 部分問題：左部分木を構築する
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // 部分問題：右部分木を構築する
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    Some(root)
}

/* 二分木の構築 */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // ハッシュ表を初期化し、inorder の各要素に対応するインデックスを格納する
    let mut inorder_map: HashMap<i32, i32> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i as i32);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
    root
}

/* 実行例 */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("行きがけ順 = {:?}", preorder);
    println!("通りがけ順 = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("構築した二分木：");
    print_util::print_tree(root.as_ref().unwrap());
}
