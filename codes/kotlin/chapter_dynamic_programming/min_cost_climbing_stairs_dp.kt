/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 爬楼梯最小代价：动态规划 */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // 初始化 dp 表，用于存储子问题的解
    val dp = IntArray(n + 1)
    // 初始状态：预设最小子问题的解
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 状态转移：从较小子问题逐步求解较大子问题
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 爬楼梯最小代价：空间优化后的动态规划 */
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
    println("输入楼梯的代价列表为 ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("爬完楼梯的最低代价为 $res")

    res = minCostClimbingStairsDPComp(cost)
    println("爬完楼梯的最低代价为 $res")
}