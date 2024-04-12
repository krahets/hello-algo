/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* 层序遍历 */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // 初始化队列，加入根节点
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 初始化一个列表，用于保存遍历序列
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // 队列出队
        list.add(node?._val!!)       // 保存节点值
        if (node.left != null)
            queue.offer(node.left)   // 左子节点入队
        if (node.right != null)
            queue.offer(node.right)  // 右子节点入队
    }
    return list
}

/* Driver Code */
fun main() {
    /* 初始化二叉树 */
    // 这里借助了一个从列表直接生成二叉树的函数
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n初始化二叉树\n")
    printTree(root)

    /* 层序遍历 */
    val list = levelOrder(root)
    println("\n层序遍历的节点打印序列 = $list")
}