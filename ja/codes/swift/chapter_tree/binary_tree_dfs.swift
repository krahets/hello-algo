/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// 走査順を記録するリストを初期化する
var list: [Int] = []

/* 行きがけ順走査 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問順：根 -> 左部分木 -> 右部分木
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* 通りがけ順走査 */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問順：左部分木 -> 根 -> 右部分木
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* 帰りがけ順走査 */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問順：左部分木 -> 右部分木 -> 根
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* 実行例 */
    static func main() {
        /* 二分木を初期化する */
        // ここでは配列から直接二分木を作る関数を使う
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n二分木を初期化\n")
        PrintUtil.printTree(root: root)

        /* 行きがけ順走査 */
        list.removeAll()
        preOrder(root: root)
        print("\n行きがけ順に出力したノードの列 = \(list)")

        /* 通りがけ順走査 */
        list.removeAll()
        inOrder(root: root)
        print("\n通りがけ順に出力したノードの列 = \(list)")

        /* 帰りがけ順走査 */
        list.removeAll()
        postOrder(root: root)
        print("\n帰りがけ順に出力したノードの列 = \(list)")
    }
}
