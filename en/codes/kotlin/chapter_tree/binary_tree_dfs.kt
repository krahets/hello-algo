/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// Initialize the list for storing traversal sequences
var list = mutableListOf<Int>()

/* Pre-order traversal */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // Visit priority: root node -> left subtree -> right subtree
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* In-order traversal */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* Post-order traversal */
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
    // This is aided by a function that generates a binary tree from a list
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\nInitialize binary tree\n")
    printTree(root)

    /* Pre-order traversal */
    list.clear()
    preOrder(root)
    println("\nPrint sequence of nodes in pre-order traversal = $list")

    /* In-order traversal */
    list.clear()
    inOrder(root)
    println("\nPrint sequence of nodes in in-order traversal = $list")

    /* Post-order traversal */
    list.clear()
    postOrder(root)
    println("\nPrint sequence of nodes in post-order traversal = $list")
}