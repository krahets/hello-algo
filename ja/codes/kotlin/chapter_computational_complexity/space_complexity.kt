/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* 関数 */
fun function(): Int {
    // 何らかの処理を行う
    return 0
}

/* 定数階 */
fun constant(n: Int) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // ループ内の変数は O(1) の空間を占める
    for (i in 0..<n) {
        val c = 0
    }
    // ループ内の関数は O(1) の空間を占める
    for (i in 0..<n) {
        function()
    }
}

/* 線形階 */
fun linear(n: Int) {
    // 長さ n の配列は O(n) の空間を使用
    val nums = Array(n) { 0 }
    // 長さ n のリストは O(n) の空間を使用
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* 線形時間（再帰実装） */
fun linearRecur(n: Int) {
    println("再帰 n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* 二乗階 */
fun quadratic(n: Int) {
    // 行列は O(n^2) の空間を使用する
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // 二次元リストは O(n^2) の空間を使用
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* 二次時間（再帰実装） */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // 配列 nums の長さは n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("再帰 n = $n における nums の長さ = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* 指数時間（完全二分木の構築） */
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
    // 定数階
    constant(n)
    // 線形階
    linear(n)
    linearRecur(n)
    // 二乗階
    quadratic(n)
    quadraticRecur(n)
    // 指数オーダー
    val root = buildTree(n)
    printTree(root)
}