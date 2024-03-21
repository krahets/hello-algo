/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* 前序遍历：例题三 */
func preOrder(root: TreeNode?) {
    // 剪枝
    guard let root = root, root.val != 3 else {
        return
    }
    // 尝试
    path.append(root)
    if root.val == 7 {
        // 记录解
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // 回退
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n初始化二叉树")
        PrintUtil.printTree(root: root)

        // 前序遍历
        path = []
        res = []
        preOrder(root: root)

        print("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
