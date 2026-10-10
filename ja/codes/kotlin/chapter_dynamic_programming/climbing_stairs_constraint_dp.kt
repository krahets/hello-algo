/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 制約付き階段登り：動的計画法 */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    val dp = Array(n + 1) { IntArray(3) }
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (i in 3..n) {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsConstraintDP(n)
    println("$n 段の階段の登り方は全部で $res 通り")
}