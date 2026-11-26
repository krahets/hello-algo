/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for ループ */
fun forLoop(n: Int): Int {
    var res = 0
    // 1, 2, ..., n-1, n の和をループで求める
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while ループ */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 条件判定用の変数を初期化
    // 1, 2, ..., n-1, n の和をループで求める
    while (i <= n) {
        res += i
        i++ // 条件判定用の変数を更新
    }
    return res
}

/* while ループ（2 回更新） */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 条件判定用の変数を初期化
    // 1, 4, 10, ... の和をループで求める
    while (i <= n) {
        res += i
        // 条件判定用の変数を更新
        i++
        i *= 2
    }
    return res
}

/* 二重の for ループ */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for (i in 1..n) {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* 実行例 */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor ループによる総和 res = $res")

    res = whileLoop(n)
    println("\nwhile ループによる総和 res = $res")

    res = whileLoopII(n)
    println("\nwhile ループ（2 回更新）による総和 res = $res")

    val resStr = nestedForLoop(n)
    println("\n二重の for ループの走査結果 $resStr")
}