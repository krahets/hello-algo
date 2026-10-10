/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 階段登り：動的計画法 */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // 部分問題の解を保存するために dp テーブルを初期化
    val dp = IntArray(n + 1)
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1
    dp[2] = 2
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 階段登り：空間最適化した動的計画法 */
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

/* Driver Code */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("$n 段の階段の登り方は全部で $res 通り")

    res = climbingStairsDPComp(n)
    println("$n 段の階段の登り方は全部で $res 通り")
}