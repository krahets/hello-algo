/**
 * File: binary_tree.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BinaryTree {
    /* Driver Code */
    static func main() {
        /* Initialize binary tree */
        // Initialize nodes
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // Build references (pointers) between nodes
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        print("\nInitialize binary tree\n")
        PrintUtil.printTree(root: n1)

        /* Insert node P between n1 -> n2 */
        let P = TreeNode(x: 0)
        // Delete node
        n1.left = P
        P.left = n2
        print("\nAfter inserting node P\n")
        PrintUtil.printTree(root: n1)
        // Remove node P
        n1.left = n2
        print("\nAfter removing node P\n")
        PrintUtil.printTree(root: n1)
    }
}
