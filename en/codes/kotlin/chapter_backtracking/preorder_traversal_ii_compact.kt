/**
 * File: preorder_traversal_ii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_ii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<MutableList<TreeNode>>? = null

/* Preorder traversal: Example 2 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    // Attempt
    path!!.add(root)
    if (root._val == 7) {
        // Record solution
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // Backtrack
    path!!.removeAt(path!!.size - 1)
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nInitialize binary tree")
    printTree(root)

    // Preorder traversal
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\nOutput all paths from root node to node 7")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}