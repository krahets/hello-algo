/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Initialize the list for storing traversal sequences
var list: [Int] = []

/* Pre-order traversal */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit priority: root node -> left subtree -> right subtree
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* In-order traversal */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Post-order traversal */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver Code */
    static func main() {
        /* Initialize binary tree */
        // Use a specific function to convert an array into a binary tree
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nInitialize binary tree\n")
        PrintUtil.printTree(root: root)

        /* Pre-order traversal */
        list.removeAll()
        preOrder(root: root)
        print("\nSequence of nodes in pre-order traversal = \(list)")

        /* In-order traversal */
        list.removeAll()
        inOrder(root: root)
        print("\nInorder traversal node print sequence = \(list)")

        /* Post-order traversal */
        list.removeAll()
        postOrder(root: root)
        print("\nPostorder traversal node print sequence = \(list)")
    }
}
