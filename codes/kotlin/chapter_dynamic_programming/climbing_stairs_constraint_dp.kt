/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 带约束爬楼梯：动态规划 */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // 初始化 dp 表，用于存储子问题的解
    val dp = Array(n + 1) { IntArray(3) }
    // 初始状态：预设最小子问题的解
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // 状态转移：从较小子问题逐步求解较大子问题
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
    println("爬 $n 阶楼梯共有 $res 种方案")
}