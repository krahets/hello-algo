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
    // 初始化佇列並加入根節點
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 初始化一個串列，用來儲存走訪序列
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // 從佇列前端取出節點
        list.add(node?._val!!)       // 儲存節點值
        if (node.left != null)
            queue.offer(node.left)   // 將左子節點加入佇列
        if (node.right != null)
            queue.offer(node.right)  // 將右子節點加入佇列
    }
    return list
}

/* 主程式 */
fun main() {
    /* 初始化二元樹 */
    // 這裡使用能從串列直接建立二元樹的函式
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n初始化二元樹\n")
    printTree(root)

    /* 層序走訪 */
    val list = levelOrder(root)
    println("\n依層序走訪印出的節點序列 = $list")
}