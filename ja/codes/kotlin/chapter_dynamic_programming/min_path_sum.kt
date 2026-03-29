/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 最小経路和：全探索 */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // 左上のセルなら探索を終了する
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // 左上隅から (i, j) までの最小経路コストを返す
    return min(left, up) + grid[i][j]
}

/* 最小経路和：メモ化探索 */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // 左上のセルなら探索を終了する
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 既に記録があればそのまま返す
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // 左と上のセルからの最小経路コスト
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // 左上から (i, j) までの最小経路コストを記録して返す
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 最小経路和：動的計画法 */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // dp テーブルを初期化
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // 状態遷移：先頭行
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 状態遷移：先頭列
    for (i in 1..<n) {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // 状態遷移: 残りの行と列
    for (i in 1..<n) {
        for (j in 1..<m) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* 最小経路和：空間最適化後の動的計画法 */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // dp テーブルを初期化
    val dp = IntArray(m)
    // 状態遷移：先頭行
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 状態遷移：残りの行
    for (i in 1..<n) {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0]
        // 状態遷移：残りの列
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

    // 全探索
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("左上から右下までの最小経路和は $res")

    // メモ化探索
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("左上から右下までの最小経路和は $res")

    // 動的計画法
    res = minPathSumDP(grid)
    println("左上から右下までの最小経路和は $res")

    // 空間最適化後の動的計画法
    res = minPathSumDPComp(grid)
    println("左上から右下までの最小経路和は $res")
}