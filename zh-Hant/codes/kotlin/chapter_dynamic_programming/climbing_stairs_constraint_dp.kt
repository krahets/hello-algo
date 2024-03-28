/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 帶約束爬樓梯：動態規劃 */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // 初始化 dp 表，用於儲存子問題的解
    val dp = Array(n + 1) { IntArray(3) }
    // 初始狀態：預設最小子問題的解
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 狀態轉移：從較小子問題逐步求解較大子問題
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
    println("爬 $n 階樓梯共有 $res 種方案")
}