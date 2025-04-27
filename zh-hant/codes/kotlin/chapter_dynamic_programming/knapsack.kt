/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 0-1 背包：暴力搜尋 */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if (i == 0 || c == 0) {
        return 0
    }
    // 若超過背包容量，則只能選擇不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // 計算不放入和放入物品 i 的最大價值
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 返回兩種方案中價值更大的那一個
    return max(no, yes)
}

/* 0-1 背包：記憶化搜尋 */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if (i == 0 || c == 0) {
        return 0
    }
    // 若已有記錄，則直接返回
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // 若超過背包容量，則只能選擇不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // 計算不放入和放入物品 i 的最大價值
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 記錄並返回兩種方案中價值更大的那一個
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 背包：動態規劃 */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 狀態轉移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c]
            } else {
                // 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 背包：空間最佳化後的動態規劃 */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // 初始化 dp 表
    val dp = IntArray(cap + 1)
    // 狀態轉移
    for (i in 1..n) {
        // 倒序走訪
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // 不選和選物品 i 這兩種方案的較大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // 暴力搜尋
    var res = knapsackDFS(wgt, _val, n, cap)
    println("不超過背包容量的最大物品價值為 $res")

    // 記憶化搜尋
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("不超過背包容量的最大物品價值為 $res")

    // 動態規劃
    res = knapsackDP(wgt, _val, cap)
    println("不超過背包容量的最大物品價值為 $res")

    // 空間最佳化後的動態規劃
    res = knapsackDPComp(wgt, _val, cap)
    println("不超過背包容量的最大物品價值為 $res")
}