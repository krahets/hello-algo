/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// Initialize list for storing traversal sequence
var list = mutableListOf<Int>()

/* Preorder traversal */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Visit priority: root node -> left subtree -> right subtree
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* Inorder traversal */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Postorder traversal */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver Code */
fun main() {
    /* Initialize binary tree */
    // Here we use a function to generate binary tree directly from list
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nInitialize binary tree\n")
    printTree(root)

    /* Preorder traversal */
    list.clear()
    preOrder(root)
    println("\nPre-order traversal node print sequence = $list")

    /* Inorder traversal */
    list.clear()
    inOrder(root)
    println("\nIn-order traversal node print sequence = $list")

    /* Postorder traversal */
    list.clear()
    postOrder(root)
    println("\nPost-order traversal node print sequence = $list")
}