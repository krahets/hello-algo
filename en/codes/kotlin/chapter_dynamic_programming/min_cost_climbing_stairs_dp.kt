/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Minimum cost to climb stairs: dynamic programming */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // Initialize the dp table to store subproblem solutions
    val dp = IntArray(n + 1)
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = cost[1]
    dp[2] = cost[2]
    // State transitions: solve progressively larger subproblems using smaller ones
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Minimum cost to climb stairs: space-optimized dynamic programming */
fun minCostClimbingStairsDPComp(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    var a = cost[1]
    var b = cost[2]
    for (i in 3..n) {
        val tmp = b
        b = min(a, tmp) + cost[i]
        a = tmp
    }
    return b
}

/* Driver code */
fun main() {
    val cost = intArrayOf(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println("Input stair costs: ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("Minimum cost to finish climbing the stairs: $res")

    res = minCostClimbingStairsDPComp(cost)
    println("Minimum cost to finish climbing the stairs: $res")
}