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

/* Constant space */
fun constant(n: Int) {
    // Constants, variables, and objects use O(1) space
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // Variables in the loop use O(1) space
    for (i in 0..<n) {
        val c = 0
    }
    // Function calls in the loop use O(1) space
    for (i in 0..<n) {
        function()
    }
}

/* Linear space */
fun linear(n: Int) {
    // An array of length n uses O(n) space
    val nums = Array(n) { 0 }
    // A list of length n uses O(n) space
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // A hash table with n entries uses O(n) space
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* Linear space (recursive) */
fun linearRecur(n: Int) {
    println("Recursive call: n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* Quadratic space */
fun quadratic(n: Int) {
    // A matrix uses O(n^2) space
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // A two-dimensional list uses O(n^2) space
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* Quadratic space (recursive) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // The successive lengths of nums are n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("Recursive call: n = $n, length of nums = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* Exponential space (build a perfect binary tree) */
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
    // Constant space
    constant(n)
    // Linear space
    linear(n)
    linearRecur(n)
    // Quadratic space
    quadratic(n)
    quadraticRecur(n)
    // Exponential space
    val root = buildTree(n)
    printTree(root)
}