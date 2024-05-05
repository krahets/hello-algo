/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Complete knapsack: Dynamic programming */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize dp table
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // State transition
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c]
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Complete knapsack: Space-optimized dynamic programming */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // Initialize dp table
    val dp = IntArray(cap + 1)
    // State transition
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[c] = dp[c]
            } else {
                // The greater value between not choosing and choosing item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // Dynamic programming
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("Maximum value of items without exceeding bag capacity = $res")

    // Space-optimized dynamic programming
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("Maximum value of items without exceeding bag capacity = $res")
}