/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Minimum path sum: Brute-force search */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // If it's the top-left cell, terminate the search
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // If row or column index is out of bounds, return +∞ cost
    if i < 0 || j < 0 {
        return .max
    }
    // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // Return the minimum path cost from top-left to (i, j)
    return min(left, up) + grid[i][j]
}

/* Minimum path sum: Memoization search */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // If it's the top-left cell, terminate the search
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // If row or column index is out of bounds, return +∞ cost
    if i < 0 || j < 0 {
        return .max
    }
    // If there's a record, return it directly
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Minimum path cost for left and upper cells
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // Record and return the minimum path cost from top-left to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Minimum path sum: Dynamic programming */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Initialize dp table
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // State transition: first row
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // State transition: first column
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // State transition: rest of the rows and columns
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Minimum path sum: Space-optimized dynamic programming */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Initialize dp table
    var dp = Array(repeating: 0, count: m)
    // State transition: first row
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // State transition: rest of the rows
    for i in 1 ..< n {
        // State transition: first column
        dp[0] = dp[0] + grid[i][0]
        // State transition: rest of the columns
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

        // Brute-force search
        var res = minPathSumDFS(grid: grid, i: n - 1, j: m - 1)
        print("Minimum path sum from top-left to bottom-right is \(res)")

        // Memoization search
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("Minimum path sum from top-left to bottom-right is \(res)")

        // Dynamic programming
        res = minPathSumDP(grid: grid)
        print("Minimum path sum from top-left to bottom-right is \(res)")

        // Space-optimized dynamic programming
        res = minPathSumDPComp(grid: grid)
        print("Minimum path sum from top-left to bottom-right is \(res)")
    }
}
