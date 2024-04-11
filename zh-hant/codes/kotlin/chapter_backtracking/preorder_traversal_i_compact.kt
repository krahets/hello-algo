/**
 * File: preorder_traversal_i_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_i_compact

import utils.TreeNode
import utils.printTree

var res: MutableList<TreeNode>? = null

/* 前序走訪：例題一 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    if (root._val == 7) {
        // 記錄解
        res!!.add(root)
    }
    preOrder(root.left)
    preOrder(root.right)
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n初始化二元樹")
    printTree(root)

    // 前序走訪
    res = mutableListOf()
    preOrder(root)

    println("\n輸出所有值為 7 的節點")
    val vals = mutableListOf<Int>()
    for (node in res!!) {
        vals.add(node._val)
    }
    println(vals)
}