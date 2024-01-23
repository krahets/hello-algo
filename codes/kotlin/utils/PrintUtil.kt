package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String) {}

fun printTree(root: utils.TreeNode?) {
    printTree(root, null, false)
}

/* Print a binary tree */
fun printTree(root: utils.TreeNode?, prev: Trunk?, isRight: Boolean) {
    if (root == null)
        return
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
    println(" ${root.value}")

    if (prev != null) {
        prev.str = prevStr
    }
    trunk.str = "   |"

    printTree(root.left, trunk, false)
}

/* Helper function to print branches of the binary tree */
fun showTrunks(p: Trunk?) {
    if (p == null) {
        return
    }
    showTrunks(p.prev)
    print(p.str)
}

/* Print a linked list */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list: MutableList<String> = ArrayList()
    while (head != null) {
        list.add(head.value.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* Print a hash map */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println(key.toString() + " -> " + value)
    }
}

/* Print a heap (PriorityQueue) */
fun printHeap(queue: Queue<Int>?) {
    val list = queue?.let { ArrayList(it) }
    print("堆的数组表示：")
    println(list)
    println("堆的树状表示：")
    val root: TreeNode? = list?.let { TreeNode.listToTree(it) }
    printTree(root)
}

/* Print a matrix (Array) */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* Print a matrix (List) */
fun <T> printMatrix(matrix: List<List<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}