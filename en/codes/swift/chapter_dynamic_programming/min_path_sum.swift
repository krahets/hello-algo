/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Minimum path sum with brute-force search */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // Stop searching at the top-left cell
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Return a cost of +∞ if either index is out of bounds
    if i < 0 || j < 0 {
        return .max
    }
    // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // Return the minimum path cost from the top left to (i, j)
    return min(left, up) + grid[i][j]
}

/* Minimum path sum with memoized search */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // Stop searching at the top-left cell
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Return a cost of +∞ if either index is out of bounds
    if i < 0 || j < 0 {
        return .max
    }
    // Return the cached result if available
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Minimum path costs for the cells to the left and above
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // Cache and return the minimum path cost from the top left to (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Minimum path sum with dynamic programming */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Initialize the dp table
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // State transitions for the first row
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // State transitions for the first column
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // State transitions for the remaining rows and columns
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Minimum path sum with space-optimized dynamic programming */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Initialize the dp table
    var dp = Array(repeating: 0, count: m)
    // State transitions for the first row
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // State transitions for the remaining rows
    for i in 1 ..< n {
        // State transitions for the first column
        dp[0] = dp[0] + grid[i][0]
        // State transitions for the remaining columns
        for j in 1 ..< m {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

@main
enum MinPathSum {
    /* Driver code */
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
        print("Minimum path sum from the top left to the bottom right: \(res)")

        // Memoized search
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("Minimum path sum from the top left to the bottom right: \(res)")

        // Dynamic programming
        res = minPathSumDP(grid: grid)
        print("Minimum path sum from the top left to the bottom right: \(res)")

        // Space-optimized dynamic programming
        res = minPathSumDPComp(grid: grid)
        print("Minimum path sum from the top left to the bottom right: \(res)")
    }
}
