/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* 移動一個圓盤 */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // 從 src 頂端取出一個圓盤
    val pan = src.removeAt(src.size - 1)
    // 將圓盤放到 tar 頂端
    tar.add(pan)
}

/* 求解河內塔問題 f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // 若 src 只剩一個圓盤，直接將它移到 tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
    dfs(i - 1, src, tar, buf)
    // 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
    move(src, tar)
    // 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
    dfs(i - 1, buf, src, tar)
}

/* 求解河內塔問題 */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // 藉助 B，將 A 頂端的 n 個圓盤移到 C
    dfs(n, A, B, C)
}

/* 主程式 */
fun main() {
    // 串列尾端對應柱子頂端
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("初始狀態：")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("圓盤移動完成後：")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}