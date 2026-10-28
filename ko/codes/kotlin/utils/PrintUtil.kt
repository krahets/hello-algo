/**
 * File: PrintUtil.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String)

/* 행렬 출력(Array) */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 행렬 출력(List) */
fun <T> printMatrix(matrix: MutableList<MutableList<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* 연결 리스트 출력 */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list = mutableListOf<String>()
    while (head != null) {
        list.add(head._val.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* 이진 트리 출력 */
fun printTree(root: TreeNode?) {
    printTree(root, null, false)
}

/**
 * 이진 트리 출력
 * 이 트리 출력 코드는 TECHIE DELIGHT에서 가져왔다
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

/* 해시 테이블 출력 */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println("${key.toString()} -> $value")
    }
}

/* 힙 출력 */
fun printHeap(queue: Queue<Int>?) {
    val list = mutableListOf<Int?>()
    queue?.let { list.addAll(it) }
    print("힙의 배열 표현:")
    println(list)
    println("힙의 트리 표현:")
    val root = TreeNode.listToTree(list)
    printTree(root)
}