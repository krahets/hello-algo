/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 最小経路和：全探索 */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // 左上のセルなら探索を終了する
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if i < 0 || j < 0 {
        return .max
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // 左上隅から (i, j) までの最小経路コストを返す
    return min(left, up) + grid[i][j]
}

/* 最小経路和：メモ化探索 */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // 左上のセルなら探索を終了する
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if i < 0 || j < 0 {
        return .max
    }
    // 既に記録があればそのまま返す
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // 左と上のセルからの最小経路コスト
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // 左上から (i, j) までの最小経路コストを記録して返す
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 最小経路和：動的計画法 */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // dp テーブルを初期化
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // 状態遷移：先頭行
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 状態遷移：先頭列
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // 状態遷移: 残りの行と列
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* 最小経路和：空間最適化後の動的計画法 */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // dp テーブルを初期化
    var dp = Array(repeating: 0, count: m)
    // 状態遷移：先頭行
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 状態遷移：残りの行
    for i in 1 ..< n {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0]
        // 状態遷移：残りの列
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

        // 全探索
        var res = minPathSumDFS(grid: grid, i: n - 1, j: m - 1)
        print("左上から右下までの最小経路和は \(res)")

        // メモ化探索
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("左上から右下までの最小経路和は \(res)")

        // 動的計画法
        res = minPathSumDP(grid: grid)
        print("左上から右下までの最小経路和は \(res)")

        // 空間最適化後の動的計画法
        res = minPathSumDPComp(grid: grid)
        print("左上から右下までの最小経路和は \(res)")
    }
}
