/**
 * File: binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* Driver Code */
fun main() {
    /* Initialize binary tree */
    // Initialize nodes
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // Build references (pointers) between nodes
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\nInitialize binary tree\n")
    printTree(n1)

    /* Insert node P between n1 -> n2 */
    val P = TreeNode(0)
    // Delete node
    n1.left = P
    P.left = n2
    println("\nAfter inserting node P\n")
    printTree(n1)
    // Remove node P
    n1.left = n2
    println("\nAfter removing node P\n")
    printTree(n1)
}