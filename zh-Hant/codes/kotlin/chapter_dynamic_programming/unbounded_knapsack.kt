/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 完全背包：动态规划 */
fun unboundedKnapsackDP(
    wgt: IntArray,
    value: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 状态转移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c]
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = max(dp[i - 1][c].toDouble(), (dp[i][c - wgt[i - 1]] + value[i - 1]).toDouble())
                    .toInt()
            }
        }
    }
    return dp[n][cap]
}

/* 完全背包：空间优化后的动态规划 */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    value: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = IntArray(cap + 1)
    // 状态转移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[c] = dp[c]
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[c] =
                    max(dp[c].toDouble(), (dp[c - wgt[i - 1]] + value[i - 1]).toDouble()).toInt()
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val value = intArrayOf(5, 11, 15)
    val cap = 4

    // 动态规划
    var res = unboundedKnapsackDP(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 $res")

    // 空间优化后的动态规划
    res = unboundedKnapsackDPComp(wgt, value, cap)
    println("不超过背包容量的最大物品价值为 $res")
}