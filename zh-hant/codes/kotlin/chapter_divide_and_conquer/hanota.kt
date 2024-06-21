/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* 移動一個圓盤 */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // 從 src 頂部拿出一個圓盤
    val pan = src.removeAt(src.size - 1)
    // 將圓盤放入 tar 頂部
    tar.add(pan)
}

/* 求解河內塔問題 f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i - 1, src, tar, buf)
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move(src, tar)
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i - 1, buf, src, tar)
}

/* 求解河內塔問題 */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // 將 A 頂部 n 個圓盤藉助 B 移到 C
    dfs(n, A, B, C)
}

/* Driver Code */
fun main() {
    // 串列尾部是柱子頂部
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("初始狀態下：")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("圓盤移動完成後：")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}