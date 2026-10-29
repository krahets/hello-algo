/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for ループ */
fun forLoop(n: Int): Int {
    var res = 0
    // ループで 1, 2, ..., n-1, n の和を求める
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while ループ */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // ループで 1, 2, ..., n-1, n の和を求める
    while (i <= n) {
        res += i
        i++ // 条件変数を更新する
    }
    return res
}

/* while ループ（2 回の更新） */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // ループで 1, 4, 10, ... の和を求める
    while (i <= n) {
        res += i
        // 条件変数を更新する
        i++
        i *= 2
    }
    return res
}

/* 二重 for ループ */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // i = 1, 2, ..., n-1, n のループ
    for (i in 1..n) {
        // j = 1, 2, ..., n-1, n のループ
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* 実行用コード */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor ループで求めた和 res = $res")

    res = whileLoop(n)
    println("\nwhile ループで求めた和 res = $res")

    res = whileLoopII(n)
    println("\nwhile ループ（2 回の更新）で求めた和 res = $res")

    val resStr = nestedForLoop(n)
    println("\n二重 for ループの走査結果 $resStr")
}