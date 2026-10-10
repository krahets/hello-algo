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

/* 前順走査：例題 2 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    // 試す
    path!!.add(root)
    if (root._val == 7) {
        // 解を記録
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // バックトラック
    path!!.removeAt(path!!.size - 1)
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化")
    printTree(root)

    // 先行順走査
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\n根ノードからノード 7 までのすべての経路を出力")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}