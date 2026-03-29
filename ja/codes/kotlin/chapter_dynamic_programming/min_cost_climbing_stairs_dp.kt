/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 階段登りの最小コスト：動的計画法 */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // 部分問題の解を保存するために dp テーブルを初期化
    val dp = IntArray(n + 1)
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
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
    println("入力された階段コストのリストは ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("階段を上り切る最小コストは $res")

    res = minCostClimbingStairsDPComp(cost)
    println("階段を上り切る最小コストは $res")
}