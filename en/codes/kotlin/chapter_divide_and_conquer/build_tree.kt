/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* Build a binary tree: divide and conquer */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // Stop when the subtree interval is empty
    if (r - l < 0) return null
    // Initialize the root node
    val root = TreeNode(preorder[i])
    // Look up m to separate the left and right subtrees
    val m = inorderMap[preorder[i]]!!
    // Subproblem: build the left subtree
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // Subproblem: build the right subtree
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // Return the root node
    return root
}

/* Build a binary tree */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // Initialize a hash table mapping each element in inorder to its index
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* Driver code */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("Preorder traversal = ${preorder.contentToString()}")
    println("Inorder traversal = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("The constructed binary tree is:")
    printTree(root)
}