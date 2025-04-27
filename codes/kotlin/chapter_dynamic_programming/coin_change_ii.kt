/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 零钱兑换 II：动态规划 */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 初始化首列
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // 状态转移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 零钱兑换 II：空间优化后的动态规划 */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // 初始化 dp 表
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // 状态转移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a]
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // 动态规划
    var res = coinChangeIIDP(coins, amt)
    println("凑出目标金额的硬币组合数量为 $res")

    // 空间优化后的动态规划
    res = coinChangeIIDPComp(coins, amt)
    println("凑出目标金额的硬币组合数量为 $res")
}