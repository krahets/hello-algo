/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Minimum path sum with brute-force search */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // Stop searching at the top-left cell
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // Return a cost of +∞ if either index is out of bounds
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // Return the minimum path cost from the top left to (i, j)
    return min(left, up) + grid[i][j]
}

/* Minimum path sum with memoized search */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // Stop searching at the top-left cell
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // Return a cost of +∞ if either index is out of bounds
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // Return the cached result if available
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // Minimum path costs for the cells to the left and above
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // Cache and return the minimum path cost from the top left to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Minimum path sum with dynamic programming */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Initialize the dp table
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // State transitions for the first row
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // State transitions for the first column
    for (i in 1..<n) {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // State transitions for the remaining rows and columns
    for (i in 1..<n) {
        for (j in 1..<m) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Minimum path sum with space-optimized dynamic programming */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Initialize the dp table
    val dp = IntArray(m)
    // State transitions for the first row
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // State transitions for the remaining rows
    for (i in 1..<n) {
        // State transitions for the first column
        dp[0] = dp[0] + grid[i][0]
        // State transitions for the remaining columns
        for (j in 1..<m) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

/* Driver code */
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
    println("Minimum path sum from the top left to the bottom right: $res")

    // Memoized search
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("Minimum path sum from the top left to the bottom right: $res")

    // Dynamic programming
    res = minPathSumDP(grid)
    println("Minimum path sum from the top left to the bottom right: $res")

    // Space-optimized dynamic programming
    res = minPathSumDPComp(grid)
    println("Minimum path sum from the top left to the bottom right: $res")
}