/**
 * File: preorder_traversal_i_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_i_compact

import utils.TreeNode
import utils.printTree

var res: MutableList<TreeNode>? = null

/* 前順走査：例題 1 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    if (root._val == 7) {
        // 解を記録
        res!!.add(root)
    }
    preOrder(root.left)
    preOrder(root.right)
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化")
    printTree(root)

    // 先行順走査
    res = mutableListOf()
    preOrder(root)

    println("\n値が 7 のノードをすべて出力")
    val vals = mutableListOf<Int>()
    for (node in res!!) {
        vals.add(node._val)
    }
    println(vals)
}