/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* 前順走査：例題 3 */
func preOrder(root: TreeNode?) {
    // 枝刈り
    guard let root = root, root.val != 3 else {
        return
    }
    // 試す
    path.append(root)
    if root.val == 7 {
        // 解を記録
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // バックトラック
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化")
        PrintUtil.printTree(root: root)

        // 先行順走査
        path = []
        res = []
        preOrder(root: root)

        print("\n根ノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まない")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
