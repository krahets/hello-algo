/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// Initialize a list to store the traversal sequence
var list: [Int] = []

/* Preorder traversal */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit order: root -> left subtree -> right subtree
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* Inorder traversal */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit order: left subtree -> root -> right subtree
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* Postorder traversal */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // Visit order: left subtree -> right subtree -> root
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* Driver code */
    static func main() {
        /* Initialize the binary tree */
        // Use a helper function that builds a binary tree directly from an array
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\nInitialize the binary tree\n")
        PrintUtil.printTree(root: root)

        /* Preorder traversal */
        list.removeAll()
        preOrder(root: root)
        print("\nNode values in preorder = \(list)")

        /* Inorder traversal */
        list.removeAll()
        inOrder(root: root)
        print("\nNode values in inorder = \(list)")

        /* Postorder traversal */
        list.removeAll()
        postOrder(root: root)
        print("\nNode values in postorder = \(list)")
    }
}
