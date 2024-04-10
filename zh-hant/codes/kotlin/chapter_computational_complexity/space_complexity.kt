/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* 函式 */
fun function(): Int {
    // 執行某些操作
    return 0
}

/* 常數階 */
fun constant(n: Int) {
    // 常數、變數、物件佔用 O(1) 空間
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // 迴圈中的變數佔用 O(1) 空間
    for (i in 0..<n) {
        val c = 0
    }
    // 迴圈中的函式佔用 O(1) 空間
    for (i in 0..<n) {
        function()
    }
}

/* 線性階 */
fun linear(n: Int) {
    // 長度為 n 的陣列佔用 O(n) 空間
    val nums = Array(n) { 0 }
    // 長度為 n 的串列佔用 O(n) 空間
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // 長度為 n 的雜湊表佔用 O(n) 空間
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* 線性階（遞迴實現） */
fun linearRecur(n: Int) {
    println("遞迴 n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* 平方階 */
fun quadratic(n: Int) {
    // 矩陣佔用 O(n^2) 空間
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // 二維串列佔用 O(n^2) 空間
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* 平方階（遞迴實現） */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // 陣列 nums 長度為 n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("遞迴 n = $n 中的 nums 長度 = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* 指數階（建立滿二元樹） */
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
    // 常數階
    constant(n)
    // 線性階
    linear(n)
    linearRecur(n)
    // 平方階
    quadratic(n)
    quadraticRecur(n)
    // 指數階
    val root = buildTree(n)
    printTree(root)
}