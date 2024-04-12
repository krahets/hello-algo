/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 零錢兌換：動態規劃 */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 狀態轉移：首行首列
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // 狀態轉移：其餘行和列
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 不選和選硬幣 i 這兩種方案的較小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* 零錢兌換：空間最佳化後的動態規劃 */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // 初始化 dp 表
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // 狀態轉移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若超過目標金額，則不選硬幣 i
                dp[a] = dp[a]
            } else {
                // 不選和選硬幣 i 這兩種方案的較小值
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

    // 動態規劃
    var res = coinChangeDP(coins, amt)
    println("湊到目標金額所需的最少硬幣數量為 $res")

    // 空間最佳化後的動態規劃
    res = coinChangeDPComp(coins, amt)
    println("湊到目標金額所需的最少硬幣數量為 $res")
}