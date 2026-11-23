/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* レベル順走査 */
func levelOrder(root: TreeNode) -> [Int] {
    // キューを初期化し、根ノードを追加する
    var queue: [TreeNode] = [root]
    // 走査順序を保存するリストを初期化する
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // キューからデキューする
        list.append(node.val) // ノードの値を保存する
        if let left = node.left {
            queue.append(left) // 左の子ノードをエンキューする
        }
        if let right = node.right {
            queue.append(right) // 右の子ノードをエンキューする
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* 実行用コード */
    static func main() {
        /* 二分木を初期化する */
        // ここでは配列から二分木を直接生成する関数を使う
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n二分木を初期化する\n")
        PrintUtil.printTree(root: node)

        /* レベル順走査 */
        let list = levelOrder(root: node)
        print("\nレベル順走査で表示するノードの順序 = \(list)")
    }
}
