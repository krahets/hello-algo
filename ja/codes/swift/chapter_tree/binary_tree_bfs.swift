/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* レベル順走査 */
func levelOrder(root: TreeNode) -> [Int] {
    // キューを初期化し、ルートノードを追加する
    var queue: [TreeNode] = [root]
    // 走査順序を保存するためのリストを初期化する
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // デキュー
        list.append(node.val) // ノードの値を保存する
        if let left = node.left {
            queue.append(left) // 左子ノードをキューに追加
        }
        if let right = node.right {
            queue.append(right) // 右子ノードをキューに追加
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* Driver Code */
    static func main() {
        /* 二分木を初期化 */
        // ここでは、配列から直接二分木を生成する関数を利用する
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n二分木を初期化\n")
        PrintUtil.printTree(root: node)

        /* レベル順走査 */
        let list = levelOrder(root: node)
        print("\nレベル順走査のノード出力シーケンス = \(list)")
    }
}
