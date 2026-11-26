/**
 * File: preorder_traversal_ii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* 前序走訪：例題二 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 嘗試
    path.append(root)
    if root.val == 7 {
        // 記錄此解
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // 回溯
    path.removeLast()
}

@main
enum PreorderTraversalIICompact {
    /* 主程式 */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n初始化二元樹")
        PrintUtil.printTree(root: root)

        // 前序走訪
        path = []
        res = []
        preOrder(root: root)

        print("\n輸出從根節點到值為 7 的節點的所有路徑")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
