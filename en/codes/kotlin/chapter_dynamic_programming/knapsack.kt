/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 0-1 knapsack: brute-force search */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 || c == 0) {
        return 0
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // Calculate the maximum values obtained by excluding and including item i
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Return the larger value from the two choices
    return max(no, yes)
}

/* 0-1 knapsack: memoized search */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 || c == 0) {
        return 0
    }
    // If a result has already been recorded, return it directly
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // Calculate the maximum values obtained by excluding and including item i
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Record and return the larger value from the two choices
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 knapsack: dynamic programming */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize the dp table
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // State transitions
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c]
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 knapsack: space-optimized dynamic programming */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Initialize the dp table
    val dp = IntArray(cap + 1)
    // State transitions
    for (i in 1..n) {
        // Traverse in decreasing order
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // Take the larger value obtained by excluding and including item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // Brute-force search
    var res = knapsackDFS(wgt, _val, n, cap)
    println("Maximum total item value within the knapsack capacity: $res")

    // Memoized search
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("Maximum total item value within the knapsack capacity: $res")

    // Dynamic programming
    res = knapsackDP(wgt, _val, cap)
    println("Maximum total item value within the knapsack capacity: $res")

    // Space-optimized dynamic programming
    res = knapsackDPComp(wgt, _val, cap)
    println("Maximum total item value within the knapsack capacity: $res")
}