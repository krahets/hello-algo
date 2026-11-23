/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 階段の上り方：動的計画法 */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // 部分問題の解を格納する dp テーブルを初期化する
    val dp = IntArray(n + 1)
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = 1
    dp[2] = 2
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 階段の上り方：空間を最適化した動的計画法 */
fun climbingStairsDPComp(n: Int): Int {
    if (n == 1 || n == 2) return n
    var a = 1
    var b = 2
    for (i in 3..n) {
        val temp = b
        b += a
        a = temp
    }
    return b
}

/* 実行用コード */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("$n 段の階段を上る方法は全部で $res 通り")

    res = climbingStairsDPComp(n)
    println("$n 段の階段を上る方法は全部で $res 通り")
}