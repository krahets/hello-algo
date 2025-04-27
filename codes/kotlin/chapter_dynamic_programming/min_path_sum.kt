/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 最小路径和：暴力搜索 */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // 返回从左上角到 (i, j) 的最小路径代价
    return min(left, up) + grid[i][j]
}

/* 最小路径和：记忆化搜索 */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // 若为左上角单元格，则终止搜索
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 若已有记录，则直接返回
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // 左边和上边单元格的最小路径代价
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 最小路径和：动态规划 */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // 初始化 dp 表
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // 状态转移：首行
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 状态转移：首列
    for (i in 1..<n) {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // 状态转移：其余行和列
    for (i in 1..<n) {
        for (j in 1..<m) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* 最小路径和：空间优化后的动态规划 */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // 初始化 dp 表
    val dp = IntArray(m)
    // 状态转移：首行
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 状态转移：其余行
    for (i in 1..<n) {
        // 状态转移：首列
        dp[0] = dp[0] + grid[i][0]
        // 状态转移：其余列
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

    // 暴力搜索
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("从左上角到右下角的最小路径和为 $res")

    // 记忆化搜索
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("从左上角到右下角的最小路径和为 $res")

    // 动态规划
    res = minPathSumDP(grid)
    println("从左上角到右下角的最小路径和为 $res")

    // 空间优化后的动态规划
    res = minPathSumDPComp(grid)
    println("从左上角到右下角的最小路径和为 $res")
}