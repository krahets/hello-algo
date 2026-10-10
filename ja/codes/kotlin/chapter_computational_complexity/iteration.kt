/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for ループ */
fun forLoop(n: Int): Int {
    var res = 0
    // 1, 2, ..., n-1, n を順に加算する
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while ループ */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // 1, 2, ..., n-1, n を順に加算する
    while (i <= n) {
        res += i
        i++ // 条件変数を更新する
    }
    return res
}

/* while ループ（2回更新） */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 条件変数を初期化する
    // 1, 4, 10, ... を順に加算する
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
    // i = 1, 2, ..., n-1, n とループする
    for (i in 1..n) {
        // j = 1, 2, ..., n-1, n とループする
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor ループの合計結果 res = $res")

    res = whileLoop(n)
    println("\nwhile ループの合計結果 res = $res")

    res = whileLoopII(n)
    println("\nwhile ループ (2 回更新) の合計結果 res = $res")

    val resStr = nestedForLoop(n)
    println("\n二重 for ループの走査結果 $resStr")
}