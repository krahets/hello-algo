/**
 * File: preorder_traversal_i_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var res: [TreeNode] = []

/* 前序遍历：例题一 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    if root.val == 7 {
        // 记录解
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
        print("\n初始化二叉树")
        PrintUtil.printTree(root: root)

        // 前序遍历
        res = []
        preOrder(root: root)

        print("\n输出所有值为 7 的节点")
        var vals: [Int] = []
        for node in res {
            vals.append(node.val)
        }
        print(vals)
    }
}
