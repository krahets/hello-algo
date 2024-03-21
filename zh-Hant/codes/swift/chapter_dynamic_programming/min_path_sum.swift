/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最小路径和：暴力搜索 */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // 若为左上角单元格，则终止搜索
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 若行列索引越界，则返回 +∞ 代价
    if i < 0 || j < 0 {
        return .max
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // 返回从左上角到 (i, j) 的最小路径代价
    return min(left, up) + grid[i][j]
}

/* 最小路径和：记忆化搜索 */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // 若为左上角单元格，则终止搜索
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 若行列索引越界，则返回 +∞ 代价
    if i < 0 || j < 0 {
        return .max
    }
    // 若已有记录，则直接返回
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 左边和上边单元格的最小路径代价
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 最小路径和：动态规划 */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // 状态转移：首行
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 状态转移：首列
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // 状态转移：其余行和列
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* 最小路径和：空间优化后的动态规划 */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: m)
    // 状态转移：首行
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 状态转移：其余行
    for i in 1 ..< n {
        // 状态转移：首列
        dp[0] = dp[0] + grid[i][0]
        // 状态转移：其余列
        for j in 1 ..< m {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

@main
enum MinPathSum {
    /* Driver Code */
    static func main() {
        let grid = [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2],
        ]
        let n = grid.count
        let m = grid[0].count

        // 暴力搜索
        var res = minPathSumDFS(grid: grid, i: n - 1, j: m - 1)
        print("从左上角到右下角的做小路径和为 \(res)")

        // 记忆化搜索
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("从左上角到右下角的做小路径和为 \(res)")

        // 动态规划
        res = minPathSumDP(grid: grid)
        print("从左上角到右下角的做小路径和为 \(res)")

        // 空间优化后的动态规划
        res = minPathSumDPComp(grid: grid)
        print("从左上角到右下角的做小路径和为 \(res)")
    }
}
