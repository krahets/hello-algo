/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* 行きがけ順走査：例題 3 */
func preOrder(root: TreeNode?) {
    // 枝刈り
    guard let root = root, root.val != 3 else {
        return
    }
    // 試行
    path.append(root)
    if root.val == 7 {
        // 解を記録する
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // 復元
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* 実行用コード */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化する")
        PrintUtil.printTree(root: root)

        // 行きがけ順走査
        path = []
        res = []
        preOrder(root: root)

        print("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
