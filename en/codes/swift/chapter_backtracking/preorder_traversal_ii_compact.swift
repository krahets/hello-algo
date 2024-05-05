/**
 * File: preorder_traversal_ii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* Pre-order traversal: Example two */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Attempt
    path.append(root)
    if root.val == 7 {
        // Record solution
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // Retract
    path.removeLast()
}

@main
enum PreorderTraversalIICompact {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nInitialize binary tree")
        PrintUtil.printTree(root: root)

        // Pre-order traversal
        path = []
        res = []
        preOrder(root: root)

        print("\nOutput all root-to-node 7 paths")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
