/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 构建二叉树：分治 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 子树区间为空时终止
    if r - l < 0 {
        return nil
    }
    // 初始化根节点
    let root = TreeNode(x: preorder[i])
    // 查询 m ，从而划分左右子树
    let m = inorderMap[preorder[i]]!
    // 子问题：构建左子树
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 子问题：构建右子树
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 返回根节点
    return root
}

/* 构建二叉树 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // 初始化哈希表，存储 inorder 元素到索引的映射
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("前序遍历 = \(preorder)")
        print("中序遍历 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("构建的二叉树为：")
        PrintUtil.printTree(root: root)
    }
}
