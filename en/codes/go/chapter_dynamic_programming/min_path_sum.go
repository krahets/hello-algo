// File: min_path_sum.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Minimum path sum: Brute-force search */
func minPathSumDFS(grid [][]int, i, j int) int {
	// If it's the top-left cell, terminate the search
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// If row or column index is out of bounds, return +∞ cost
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
	up := minPathSumDFS(grid, i-1, j)
	left := minPathSumDFS(grid, i, j-1)
	// Return the minimum path cost from top-left to (i, j)
	return int(math.Min(float64(left), float64(up))) + grid[i][j]
}

/* Minimum path sum: Memoization search */
func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
	// If it's the top-left cell, terminate the search
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// If row or column index is out of bounds, return +∞ cost
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// If there's a record, return it directly
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// Minimum path cost for left and upper cells
	up := minPathSumDFSMem(grid, mem, i-1, j)
	left := minPathSumDFSMem(grid, mem, i, j-1)
	// Record and return the minimum path cost from top-left to (i, j)
	mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
	return mem[i][j]
}

/* Minimum path sum: Dynamic programming */
func minPathSumDP(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// Initialize dp table
	dp := make([][]int, n)
	for i := 0; i < n; i++ {
		dp[i] = make([]int, m)
	}
	dp[0][0] = grid[0][0]
	// State transition: first row
	for j := 1; j < m; j++ {
		dp[0][j] = dp[0][j-1] + grid[0][j]
	}
	// State transition: first column
	for i := 1; i < n; i++ {
		dp[i][0] = dp[i-1][0] + grid[i][0]
	}
	// State transition: rest of the rows and columns
	for i := 1; i < n; i++ {
		for j := 1; j < m; j++ {
			dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
		}
	}
	return dp[n-1][m-1]
}

/* Minimum path sum: Space-optimized dynamic programming */
func minPathSumDPComp(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// Initialize dp table
	dp := make([]int, m)
	// State transition: first row
	dp[0] = grid[0][0]
	for j := 1; j < m; j++ {
		dp[j] = dp[j-1] + grid[0][j]
	}
	// State transition: rest of the rows and columns
	for i := 1; i < n; i++ {
		// State transition: first column
		dp[0] = dp[0] + grid[i][0]
		// State transition: rest of the columns
		for j := 1; j < m; j++ {
			dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
		}
	}
	return dp[m-1]
}
