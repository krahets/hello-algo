/**
 * File: preorder_traversal_iii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<MutableList<TreeNode>>? = null

/* 行きがけ順走査：例題 3 */
fun preOrder(root: TreeNode?) {
    // 枝刈り
    if (root == null || root._val == 3) {
        return
    }
    // 試行
    path!!.add(root)
    if (root._val == 7) {
        // 解を記録する
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // 復元
    path!!.removeAt(path!!.size - 1)
}

/* 実行用コード */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化する")
    printTree(root)

    // 行きがけ順走査
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}