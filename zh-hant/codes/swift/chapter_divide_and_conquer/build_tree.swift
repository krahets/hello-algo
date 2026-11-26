/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 建構二元樹：分治法 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 子樹區間為空時終止
    if r - l < 0 {
        return nil
    }
    // 初始化根節點
    let root = TreeNode(x: preorder[i])
    // 查出 m，據此劃分左右子樹
    let m = inorderMap[preorder[i]]!
    // 子問題：建構左子樹
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 子問題：建構右子樹
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 回傳根節點
    return root
}

/* 建構二元樹 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // 初始化雜湊表，記錄 inorder 中各元素對應的索引
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* 主程式 */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("前序走訪 = \(preorder)")
        print("中序走訪 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("建構出的二元樹為：")
        PrintUtil.printTree(root: root)
    }
}
