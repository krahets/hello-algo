/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二分木の構築：分割統治法 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 部分木の区間が空なら終了する
    if r - l < 0 {
        return nil
    }
    // 根ノードを初期化する
    let root = TreeNode(x: preorder[i])
    // m を調べて左右の部分木を分ける
    let m = inorderMap[preorder[i]]!
    // 部分問題：左部分木を構築する
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 部分問題：右部分木を構築する
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 根ノードを返す
    return root
}

/* 二分木の構築 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // ハッシュ表を初期化し、inorder の各要素に対応するインデックスを格納する
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* 実行例 */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("行きがけ順 = \(preorder)")
        print("通りがけ順 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("構築した二分木：")
        PrintUtil.printTree(root: root)
    }
}
