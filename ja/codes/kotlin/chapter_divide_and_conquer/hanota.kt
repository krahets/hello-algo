/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* 円盤を 1 枚移動 */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // src の上から円盤を1枚取り出す
    val pan = src.removeAt(src.size - 1)
    // 円盤を tar の上に置く
    tar.add(pan)
}

/* ハノイの塔の問題 f(i) を解く */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
    if (i == 1) {
        move(src, tar)
        return
    }
    // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
    dfs(i - 1, src, tar, buf)
    // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
    move(src, tar)
    // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
    dfs(i - 1, buf, src, tar)
}

/* ハノイの塔を解く */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // A の上から n 枚の円盤を B を介して C へ移す
    dfs(n, A, B, C)
}

/* Driver Code */
fun main() {
    // リスト末尾が柱の頂上
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("初期状態：")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("円盤の移動完了後：")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}