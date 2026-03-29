/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// 走査順序を格納するリストを初期化
var list: [Int] = []

/* 先行順走査 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* 中順走査 */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* 後順走査 */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* 二分木を初期化 */
        // ここでは、配列から直接二分木を生成する関数を利用する
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n二分木を初期化\n")
        PrintUtil.printTree(root: root)

        /* 先行順走査 */
        list.removeAll()
        preOrder(root: root)
        print("\n前順走査のノード出力シーケンス = \(list)")

        /* 中順走査 */
        list.removeAll()
        inOrder(root: root)
        print("\n中順走査のノード出力シーケンス = \(list)")

        /* 後順走査 */
        list.removeAll()
        postOrder(root: root)
        print("\n後順走査のノード出力シーケンス = \(list)")
    }
}
