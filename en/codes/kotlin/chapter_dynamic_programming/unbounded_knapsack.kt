/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Unbounded knapsack with dynamic programming */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize the dp table
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // State transition
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[i][c] = dp[i - 1][c]
            } else {
                // Take the larger value from skipping or taking item i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Unbounded knapsack with space-optimized dynamic programming */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // Initialize the dp table
    val dp = IntArray(cap + 1)
    // State transition
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[c] = dp[c]
            } else {
                // Take the larger value from skipping or taking item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver code */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // Dynamic programming
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("Maximum total item value within the weight limit: $res")

    // Space-optimized dynamic programming
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("Maximum total item value within the weight limit: $res")
}