/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// Initialize a list to store the traversal sequence
var list = mutableListOf<Int>()

/* Preorder traversal */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Visit order: root -> left subtree -> right subtree
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* Inorder traversal */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Visit order: left subtree -> root -> right subtree
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Postorder traversal */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // Visit order: left subtree -> right subtree -> root
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* Driver code */
fun main() {
    /* Initialize the binary tree */
    // Use a helper function that builds a binary tree directly from a list
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nInitialize the binary tree\n")
    printTree(root)

    /* Preorder traversal */
    list.clear()
    preOrder(root)
    println("\nNode sequence from preorder traversal = $list")

    /* Inorder traversal */
    list.clear()
    inOrder(root)
    println("\nNode sequence from inorder traversal = $list")

    /* Postorder traversal */
    list.clear()
    postOrder(root)
    println("\nNode sequence from postorder traversal = $list")
}