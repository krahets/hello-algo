/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::binary_tree::BinaryTree;
use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

pub type TreeNode = hello_algo_rust::binary_tree::TreeNode<i32>;

/* 构建二叉树：分治 */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, usize>,
    i: usize,
    l: usize,
    r: usize,
) -> Option<Rc<RefCell<TreeNode>>> {
    // 子树区间为空时终止
    if r < l {
        return None;
    }

    // 初始化根节点
    let val = preorder[i];
    let root = TreeNode::new(val);

    // 查询 m ，从而划分左右子树
    let m = inorder_map.get(&val).expect("preorder 与 inorder 不匹配");

    // 子问题：构建左子树
    {
        let i = i + 1;
        // 如果 m == 0，说明左子树区间为空，停止压栈
        if let Some(r) = m.checked_sub(1) {
            root.borrow_mut().left = dfs(preorder, inorder_map, i, l, r);
        };
    }

    // 子问题：构建右子树
    {
        // m 恒大于等于 l ，不会发生减法溢出
        let i = i + 1 + (m - l);
        let l = m + 1;
        root.borrow_mut().right = dfs(preorder, inorder_map, i, l, r);
    }

    // 返回根节点
    Some(root)
}

/* 构建二叉树 */
pub fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // preorder 和 inorder 要维持如下不变量：
    //
    // - 长度相等
    // - 元素相同
    // - 各数组都无重复元素
    //
    // 为简洁起见，此处不对上述条件进行校验。

    if inorder.is_empty() {
        return None;
    }

    // 初始化哈希表，存储 inorder 元素到索引的映射
    let mut inorder_map: HashMap<i32, usize> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() - 1);
    root
}

/* Driver Code */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("前序遍历 = {preorder:?}");
    println!("中序遍历 = {inorder:?}");

    let root = build_tree(&preorder, &inorder);
    println!("构建的二叉树为：\n{}", root.display());
}
