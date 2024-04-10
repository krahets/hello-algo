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

/* 前序走訪：例題三 */
fun preOrder(root: TreeNode?) {
    // 剪枝
    if (root == null || root._val == 3) {
        return
    }
    // 嘗試
    path!!.add(root)
    if (root._val == 7) {
        // 記錄解
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // 回退
    path!!.removeAt(path!!.size - 1)
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n初始化二元樹")
    printTree(root)

    // 前序走訪
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\n輸出所有根節點到節點 7 的路徑，路徑中不包含值為 3 的節點")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}