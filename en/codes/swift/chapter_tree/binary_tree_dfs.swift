/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Initialize list for storing traversal sequence
var list: [Int] = []

/* Preorder traversal */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit priority: root node -> left subtree -> right subtree
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* Inorder traversal */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Postorder traversal */
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
        // Here we use a function to generate a binary tree directly from an array
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nInitialize binary tree\n")
        PrintUtil.printTree(root: root)

        /* Preorder traversal */
        list.removeAll()
        preOrder(root: root)
        print("\nPre-order traversal node print sequence = \(list)")

        /* Inorder traversal */
        list.removeAll()
        inOrder(root: root)
        print("\nIn-order traversal node print sequence = \(list)")

        /* Postorder traversal */
        list.removeAll()
        postOrder(root: root)
        print("\nPost-order traversal node print sequence = \(list)")
    }
}
