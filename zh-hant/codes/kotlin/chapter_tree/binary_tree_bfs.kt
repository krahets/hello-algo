/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* 層序走訪 */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // 初始化佇列，加入根節點
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 初始化一個串列，用於儲存走訪序列
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // 隊列出隊
        list.add(node?._val!!)       // 儲存節點值
        if (node.left != null)
            queue.offer(node.left)   // 左子節點入列
        if (node.right != null)
            queue.offer(node.right)  // 右子節點入列
    }
    return list
}

/* Driver Code */
fun main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從串列直接生成二元樹的函式
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n初始化二元樹\n")
    printTree(root)

    /* 層序走訪 */
    val list = levelOrder(root)
    println("\n層序走訪的節點列印序列 = $list")
}