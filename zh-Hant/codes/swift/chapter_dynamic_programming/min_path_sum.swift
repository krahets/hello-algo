/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最小路徑和：暴力搜尋 */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // 若為左上角單元格，則終止搜尋
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 若行列索引越界，則返回 +∞ 代價
    if i < 0 || j < 0 {
        return .max
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // 返回從左上角到 (i, j) 的最小路徑代價
    return min(left, up) + grid[i][j]
}

/* 最小路徑和：記憶化搜尋 */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // 若為左上角單元格，則終止搜尋
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 若行列索引越界，則返回 +∞ 代價
    if i < 0 || j < 0 {
        return .max
    }
    // 若已有記錄，則直接返回
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 左邊和上邊單元格的最小路徑代價
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 最小路徑和：動態規劃 */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // 狀態轉移：首行
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 狀態轉移：首列
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // 狀態轉移：其餘行和列
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* 最小路徑和：空間最佳化後的動態規劃 */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: m)
    // 狀態轉移：首行
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 狀態轉移：其餘行
    for i in 1 ..< n {
        // 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0]
        // 狀態轉移：其餘列
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

        // 暴力搜尋
        var res = minPathSumDFS(grid: grid, i: n - 1, j: m - 1)
        print("從左上角到右下角的做小路徑和為 \(res)")

        // 記憶化搜尋
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("從左上角到右下角的做小路徑和為 \(res)")

        // 動態規劃
        res = minPathSumDP(grid: grid)
        print("從左上角到右下角的做小路徑和為 \(res)")

        // 空間最佳化後的動態規劃
        res = minPathSumDPComp(grid: grid)
        print("從左上角到右下角的做小路徑和為 \(res)")
    }
}
