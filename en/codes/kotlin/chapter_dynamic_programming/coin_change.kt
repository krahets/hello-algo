/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Coin change: dynamic programming */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Initialize the dp table
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // State transitions: first row and first column
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // State transitions: remaining rows and columns
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If the coin value exceeds the current amount a, do not choose coin i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* Coin change: space-optimized dynamic programming */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Initialize the dp table
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // State transitions
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If the coin value exceeds the current amount a, do not choose coin i
                dp[a] = dp[a]
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* Driver code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // Dynamic programming
    var res = coinChangeDP(coins, amt)
    println("Minimum number of coins needed to make the target amount: $res")

    // Space-optimized dynamic programming
    res = coinChangeDPComp(coins, amt)
    println("Minimum number of coins needed to make the target amount: $res")
}