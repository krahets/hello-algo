/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Minimum path sum: Brute-force search */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // Return the minimum path cost from top-left to (i, j)
    return min(left, up) + grid[i][j]
}

/* Minimum path sum: Memoization search */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // If it's the top-left cell, terminate the search
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // If row or column index is out of bounds, return +∞ cost
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // If there's a record, return it directly
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // Minimum path cost for left and upper cells
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // Record and return the minimum path cost from top-left to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Minimum path sum: Dynamic programming */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Initialize dp table
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // State transition: first row
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // State transition: first column
    for (i in 1..<n) {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // State transition: rest of the rows and columns
    for (i in 1..<n) {
        for (j in 1..<m) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Minimum path sum: Space-optimized dynamic programming */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Initialize dp table
    val dp = IntArray(m)
    // State transition: first row
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // State transition: rest of the rows
    for (i in 1..<n) {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0]
        // State transition: rest of the columns
        for (j in 1..<m) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

/* Driver Code */
fun main() {
    val grid = arrayOf(
        intArrayOf(1, 3, 1, 5),
        intArrayOf(2, 2, 4, 2),
        intArrayOf(5, 3, 2, 1),
        intArrayOf(4, 3, 5, 2)
    )
    val n = grid.size
    val m = grid[0].size

    // Brute-force search
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("Minimum path sum from top-left to bottom-right is $res")

    // Memoization search
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("Minimum path sum from top-left to bottom-right is $res")

    // Dynamic programming
    res = minPathSumDP(grid)
    println("Minimum path sum from top-left to bottom-right is $res")

    // Space-optimized dynamic programming
    res = minPathSumDPComp(grid)
    println("Minimum path sum from top-left to bottom-right is $res")
}