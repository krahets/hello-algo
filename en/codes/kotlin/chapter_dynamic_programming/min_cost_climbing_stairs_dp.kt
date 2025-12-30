/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Minimum cost climbing stairs: Dynamic programming */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // Initialize dp table, used to store solutions to subproblems
    val dp = IntArray(n + 1)
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = cost[1]
    dp[2] = cost[2]
    // State transition: gradually solve larger subproblems from smaller ones
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Minimum cost climbing stairs: Space-optimized dynamic programming */
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

/* Driver Code */
fun main() {
    val cost = intArrayOf(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println("Input stair cost list is ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("Minimum cost to climb stairs is $res")

    res = minCostClimbingStairsDPComp(cost)
    println("Minimum cost to climb stairs is $res")
}