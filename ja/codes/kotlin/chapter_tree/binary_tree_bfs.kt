/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* レベル順走査 */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // キューを初期化し、根ノードを追加する
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 走査順序を保存するリストを初期化する
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // キューからデキューする
        list.add(node?._val!!)       // ノードの値を保存する
        if (node.left != null)
            queue.offer(node.left)   // 左の子ノードをエンキューする
        if (node.right != null)
            queue.offer(node.right)  // 右の子ノードをエンキューする
    }
    return list
}

/* 実行用コード */
fun main() {
    /* 二分木を初期化する */
    // ここではリストから二分木を直接生成する関数を使う
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n二分木を初期化する\n")
    printTree(root)

    /* レベル順走査 */
    val list = levelOrder(root)
    println("\nレベル順走査で表示するノードの順序 = $list")
}