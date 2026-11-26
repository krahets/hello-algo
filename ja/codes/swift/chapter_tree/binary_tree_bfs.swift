/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* レベル順走査 */
func levelOrder(root: TreeNode) -> [Int] {
    // キューを初期化して根を入れる
    var queue: [TreeNode] = [root]
    // 走査順を記録するリストを初期化する
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // キューの先頭から取り出す
        list.append(node.val) // ノードの値を記録する
        if let left = node.left {
            queue.append(left) // 左の子をキューに入れる
        }
        if let right = node.right {
            queue.append(right) // 右の子をキューに入れる
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* 実行例 */
    static func main() {
        /* 二分木を初期化する */
        // ここでは配列から直接二分木を作る関数を使う
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n二分木を初期化\n")
        PrintUtil.printTree(root: node)

        /* レベル順走査 */
        let list = levelOrder(root: node)
        print("\nレベル順に出力したノードの列 = \(list)")
    }
}
