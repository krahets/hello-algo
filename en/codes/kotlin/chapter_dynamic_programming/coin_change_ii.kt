/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Coin change II: Dynamic programming */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Initialize dp table
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Initialize first column
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // State transition
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Coin change II: Space-optimized dynamic programming */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Initialize dp table
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // State transition
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a]
            } else {
                // Sum of the two options: not selecting and selecting coin i
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

    // Dynamic programming
    var res = coinChangeIIDP(coins, amt)
    println("Number of coin combinations to make target amount is $res")

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt)
    println("Number of coin combinations to make target amount is $res")
}