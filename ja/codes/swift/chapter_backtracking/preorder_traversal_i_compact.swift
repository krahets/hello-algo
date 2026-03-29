/**
 * File: preorder_traversal_i_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var res: [TreeNode] = []

/* 前順走査：例題 1 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    if root.val == 7 {
        // 解を記録
        res.append(root)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
}

@main
enum PreorderTraversalICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化")
        PrintUtil.printTree(root: root)

        // 先行順走査
        res = []
        preOrder(root: root)

        print("\n値が 7 のすべてのノードを出力")
        var vals: [Int] = []
        for node in res {
            vals.append(node.val)
        }
        print(vals)
    }
}
