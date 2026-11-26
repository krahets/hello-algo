/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 完全背包：動態規劃 */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 狀態轉移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 若重量超過背包容量，就不選物品 i
                dp[i][c] = dp[i - 1][c]
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 完全背包：空間最佳化後的動態規劃 */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = IntArray(cap + 1)
    // 狀態轉移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 若重量超過背包容量，就不選物品 i
                dp[c] = dp[c]
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* 主程式 */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // 動態規劃
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("在背包容量限制內，物品的最大總價值為 $res")

    // 空間最佳化後的動態規劃
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("在背包容量限制內，物品的最大總價值為 $res")
}