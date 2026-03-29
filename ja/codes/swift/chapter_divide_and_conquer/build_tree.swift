/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二分木を構築：分割統治 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 部分木区間が空なら終了する
    if r - l < 0 {
        return nil
    }
    // ルートノードを初期化する
    let root = TreeNode(x: preorder[i])
    // m を求めて左右部分木を分割する
    let m = inorderMap[preorder[i]]!
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 根ノードを返す
    return root
}

/* 二分木を構築 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* Driver Code */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("前順走査 = \(preorder)")
        print("中順走査 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("構築した二分木は：")
        PrintUtil.printTree(root: root)
    }
}
