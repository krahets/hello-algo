/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* 移动一个圆盘 */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // 从 src 顶部拿出一个圆盘
    val pan = src.removeAt(src.size - 1)
    // 将圆盘放入 tar 顶部
    tar.add(pan)
}

/* 求解汉诺塔问题 f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf)
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar)
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar)
}

/* 求解汉诺塔问题 */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C)
}

/* Driver Code */
fun main() {
    // 列表尾部是柱子顶部
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("初始状态下：")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("圆盘移动完成后：")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}