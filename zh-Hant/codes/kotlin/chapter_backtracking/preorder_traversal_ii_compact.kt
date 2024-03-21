/**
 * File: preorder_traversal_ii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_ii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<List<TreeNode>>? = null

/* 前序遍历：例题二 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    // 尝试
    path!!.add(root)
    if (root.value == 7) {
        // 记录解
        res!!.add(ArrayList(path!!))
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
    path = java.util.ArrayList<TreeNode>()
    res = java.util.ArrayList<List<TreeNode>>()
    preOrder(root)

    println("\n输出所有根节点到节点 7 的路径")
    for (path in res as ArrayList<List<TreeNode>>) {
        val values: MutableList<Int> = ArrayList()
        for (node in path) {
            values.add(node.value)
        }
        println(values)
    }
}