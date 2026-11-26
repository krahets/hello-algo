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
    // キューを初期化して根を入れる
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 走査順を記録するリストを初期化する
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // キューの先頭から取り出す
        list.add(node?._val!!)       // ノードの値を記録する
        if (node.left != null)
            queue.offer(node.left)   // 左の子をキューに入れる
        if (node.right != null)
            queue.offer(node.right)  // 右の子をキューに入れる
    }
    return list
}

/* 実行例 */
fun main() {
    /* 二分木を初期化する */
    // ここではリストから直接二分木を作る関数を使う
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n二分木を初期化\n")
    printTree(root)

    /* レベル順走査 */
    val list = levelOrder(root)
    println("\nレベル順に出力したノードの列 = $list")
}