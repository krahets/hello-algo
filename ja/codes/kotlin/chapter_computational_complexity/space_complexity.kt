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

/* 定数オーダー */
fun constant(n: Int) {
    // 定数・変数・オブジェクトが使う領域は O(1)
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // ループ内の変数が使う領域は O(1)
    for (i in 0..<n) {
        val c = 0
    }
    // ループ内の関数が使う領域は O(1)
    for (i in 0..<n) {
        function()
    }
}

/* 線形オーダー */
fun linear(n: Int) {
    // 長さ n の配列が使う領域は O(n)
    val nums = Array(n) { 0 }
    // 長さ n のリストが使う領域は O(n)
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // 長さ n のハッシュテーブルが使う領域は O(n)
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* 線形オーダー（再帰による実装） */
fun linearRecur(n: Int) {
    println("再帰 n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* 二次オーダー */
fun quadratic(n: Int) {
    // 行列が使う領域は O(n^2)
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // 二次元リストが使う領域は O(n^2)
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* 二次オーダー（再帰による実装） */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // 配列 nums の長さは順に n, n-1, ..., 2, 1
    val nums = Array(n) { 0 }
    println("再帰 n = $n での nums の長さ = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* 指数オーダー（すべての葉が同じ深さの完全二分木を構築） */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* 実行例 */
fun main() {
    val n = 5
    // 定数オーダー
    constant(n)
    // 線形オーダー
    linear(n)
    linearRecur(n)
    // 二次オーダー
    quadratic(n)
    quadraticRecur(n)
    // 指数オーダー
    val root = buildTree(n)
    printTree(root)
}