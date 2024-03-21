/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 構建二元樹：分治 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 子樹區間為空時終止
    if r - l < 0 {
        return nil
    }
    // 初始化根節點
    let root = TreeNode(x: preorder[i])
    // 查詢 m ，從而劃分左右子樹
    let m = inorderMap[preorder[i]]!
    // 子問題：構建左子樹
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 子問題：構建右子樹
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 返回根節點
    return root
}

/* 構建二元樹 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // 初始化雜湊表，儲存 inorder 元素到索引的對映
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("前序走訪 = \(preorder)")
        print("中序走訪 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("構建的二元樹為：")
        PrintUtil.printTree(root: root)
    }
}
