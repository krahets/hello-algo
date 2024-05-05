/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* Build binary tree: Divide and conquer */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // Terminate when subtree interval is empty
    if (r - l < 0) return null
    // Initialize root node
    val root = TreeNode(preorder[i])
    // Query m to divide left and right subtrees
    val m = inorderMap[preorder[i]]!!
    // Subproblem: build left subtree
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // Subproblem: build right subtree
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // Return root node
    return root
}

/* Build binary tree */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // Initialize hash table, storing in-order elements to indices mapping
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* Driver Code */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("Pre-order traversal = ${pre-order.contentToString()}")
    println("In-order traversal = ${in-order.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("The built binary tree is:")
    printTree(root)
}