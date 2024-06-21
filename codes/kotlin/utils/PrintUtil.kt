/**
 * File: PrintUtil.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String)

/* 打印矩阵（Array） */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 打印矩阵（List） */
fun <T> printMatrix(matrix: MutableList<MutableList<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 打印链表 */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list = mutableListOf<String>()
    while (head != null) {
        list.add(head._val.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* 打印二叉树 */
fun printTree(root: TreeNode?) {
    printTree(root, null, false)
}

/**
 * 打印二叉树
 * This tree printer is borrowed from TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
fun printTree(root: TreeNode?, prev: Trunk?, isRight: Boolean) {
    if (root == null) {
        return
    }

    var prevStr = "    "
    val trunk = Trunk(prev, prevStr)

    printTree(root.right, trunk, true)

    if (prev == null) {
        trunk.str = "———"
    } else if (isRight) {
        trunk.str = "/———"
        prevStr = "   |"
    } else {
        trunk.str = "\\———"
        prev.str = prevStr
    }

    showTrunks(trunk)
    println(" ${root._val}")

    if (prev != null) {
        prev.str = prevStr
    }
    trunk.str = "   |"

    printTree(root.left, trunk, false)
}

fun showTrunks(p: Trunk?) {
    if (p == null) {
        return
    }
    showTrunks(p.prev)
    print(p.str)
}

/* 打印哈希表 */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println("${key.toString()} -> $value")
    }
}

/* 打印堆 */
fun printHeap(queue: Queue<Int>?) {
    val list = mutableListOf<Int?>()
    queue?.let { list.addAll(it) }
    print("堆的数组表示：")
    println(list)
    println("堆的树状表示：")
    val root = TreeNode.listToTree(list)
    printTree(root)
}