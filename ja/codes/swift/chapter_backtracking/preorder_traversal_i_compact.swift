/**
 * File: preorder_traversal_i_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var res: [TreeNode] = []

/* 行きがけ順走査：例題 1 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    if root.val == 7 {
        // 解を記録する
        res.append(root)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
}

@main
enum PreorderTraversalICompact {
    /* 実行用コード */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化する")
        PrintUtil.printTree(root: root)

        // 行きがけ順走査
        res = []
        preOrder(root: root)

        print("\n値が 7 であるすべてのノードを出力する")
        var vals: [Int] = []
        for node in res {
            vals.append(node.val)
        }
        print(vals)
    }
}
