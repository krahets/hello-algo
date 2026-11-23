/**
 * File: preorder_traversal_ii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* Preorder traversal: example 2 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Try
    path.append(root)
    if root.val == 7 {
        // Record the solution
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // Backtrack
    path.removeLast()
}

@main
enum PreorderTraversalIICompact {
    /* Driver code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nInitialize the binary tree")
        PrintUtil.printTree(root: root)

        // Preorder traversal
        path = []
        res = []
        preOrder(root: root)

        print("\nOutput all paths from the root to nodes with value 7")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
