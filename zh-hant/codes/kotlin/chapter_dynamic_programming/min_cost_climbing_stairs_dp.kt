/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 爬樓梯最小代價：動態規劃 */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // 初始化 dp 表，用於儲存子問題的解
    val dp = IntArray(n + 1)
    // 初始狀態：預設最小子問題的解
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 爬樓梯最小代價：空間最佳化後的動態規劃 */
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
    println("輸入樓梯的代價串列為 ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("爬完樓梯的最低代價為 $res")

    res = minCostClimbingStairsDPComp(cost)
    println("爬完樓梯的最低代價為 $res")
}