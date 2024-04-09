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

/* 前序遍历：例题三 */
fun preOrder(root: TreeNode?) {
    // 剪枝
    if (root == null || root._val == 3) {
        return
    }
    // 尝试
    path!!.add(root)
    if (root._val == 7) {
        // 记录解
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
    println("\n初始化二叉树")
    printTree(root)

    // 前序遍历
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}