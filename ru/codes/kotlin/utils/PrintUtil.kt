/**
 * File: PrintUtil.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String)

/* Вывести матрицу (Array) */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* Вывести матрицу (List) */
fun <T> printMatrix(matrix: MutableList<MutableList<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* Вывести связный список */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list = mutableListOf<String>()
    while (head != null) {
        list.add(head._val.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* Вывести двоичное дерево */
fun printTree(root: TreeNode?) {
    printTree(root, null, false)
}

/**
 * Вывести двоичное дерево
 * Этот вывод дерева заимствован из TECHIE DELIGHT
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

/* Вывести хеш-таблицу */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println("${key.toString()} -> $value")
    }
}

/* Вывести кучу */
fun printHeap(queue: Queue<Int>?) {
    val list = mutableListOf<Int?>()
    queue?.let { list.addAll(it) }
    print("Массивное представление кучи:")
    println(list)
    println("Древовидное представление кучи:")
    val root = TreeNode.listToTree(list)
    printTree(root)
}