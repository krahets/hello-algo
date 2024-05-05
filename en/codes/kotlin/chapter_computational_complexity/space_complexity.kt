/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* Function */
fun function(): Int {
    // Perform some operations
    return 0
}

/* Constant complexity */
fun constant(n: Int) {
    // Constants, variables, objects occupy O(1) space
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // Variables in a loop occupy O(1) space
    for (i in 0..<n) {
        val c = 0
    }
    // Functions in a loop occupy O(1) space
    for (i in 0..<n) {
        function()
    }
}

/* Linear complexity */
fun linear(n: Int) {
    // Array of length n occupies O(n) space
    val nums = Array(n) { 0 }
    // A list of length n occupies O(n) space
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // A hash table of length n occupies O(n) space
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* Linear complexity (recursive implementation) */
fun linearRecur(n: Int) {
    println("Recursion n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* Quadratic complexity */
fun quadratic(n: Int) {
    // Matrix occupies O(n^2) space
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // A two-dimensional list occupies O(n^2) space
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* Quadratic complexity (recursive implementation) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // Array nums length = n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("Recursion n = $n with nums length = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* Exponential complexity (building a full binary tree) */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* Driver Code */
fun main() {
    val n = 5
    // Constant complexity
    constant(n)
    // Linear complexity
    linear(n)
    linearRecur(n)
    // Quadratic complexity
    quadratic(n)
    quadraticRecur(n)
    // Exponential complexity
    val root = buildTree(n)
    printTree(root)
}