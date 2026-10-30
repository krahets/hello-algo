/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Coin change II: dynamic programming */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Initialize the dp table
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Initialize the first column
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // State transitions
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If the coin value exceeds the current amount a, do not choose coin i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Add the numbers of ways without and with coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Coin change II: space-optimized dynamic programming */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Initialize the dp table
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // State transitions
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If the coin value exceeds the current amount a, do not choose coin i
                dp[a] = dp[a]
            } else {
                // Add the numbers of ways without and with coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* Driver code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // Dynamic programming
    var res = coinChangeIIDP(coins, amt)
    println("Number of coin combinations that make the target amount: $res")

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt)
    println("Number of coin combinations that make the target amount: $res")
}