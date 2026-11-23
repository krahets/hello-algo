/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二分木の構築：分割統治法 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 部分木の区間が空の場合、終了する
    if r - l < 0 {
        return nil
    }
    // 根ノードを初期化する
    let root = TreeNode(x: preorder[i])
    // m を調べ、左右の部分木に分割する
    let m = inorderMap[preorder[i]]!
    // 部分問題：左部分木の構築
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 部分問題：右部分木の構築
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 根ノードを返す
    return root
}

/* 二分木を構築する */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* 実行用コード */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("行きがけ順走査 = \(preorder)")
        print("通りがけ順走査 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("構築した二分木：")
        PrintUtil.printTree(root: root)
    }
}
