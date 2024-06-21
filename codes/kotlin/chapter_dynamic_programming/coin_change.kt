/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 零钱兑换：动态规划 */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 状态转移：首行首列
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // 状态转移：其余行和列
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* 零钱兑换：空间优化后的动态规划 */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // 状态转移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a]
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // 动态规划
    var res = coinChangeDP(coins, amt)
    println("凑到目标金额所需的最少硬币数量为 $res")

    // 空间优化后的动态规划
    res = coinChangeDPComp(coins, amt)
    println("凑到目标金额所需的最少硬币数量为 $res")
}