/**
 * File: PrintUtil.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String)

/* 列印矩陣（Array） */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 列印矩陣（List） */
fun <T> printMatrix(matrix: MutableList<MutableList<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 列印鏈結串列 */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list = mutableListOf<String>()
    while (head != null) {
        list.add(head._val.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* 列印二元樹 */
fun printTree(root: TreeNode?) {
    printTree(root, null, false)
}

/**
 * 列印二元樹
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

/* 列印雜湊表 */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println("${key.toString()} -> $value")
    }
}

/* 列印堆積 */
fun printHeap(queue: Queue<Int>?) {
    val list = mutableListOf<Int?>()
    queue?.let { list.addAll(it) }
    print("堆積的陣列表示：")
    println(list)
    println("堆積的樹狀表示：")
    val root = TreeNode.listToTree(list)
    printTree(root)
}