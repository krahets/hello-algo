// File: min_path_sum.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 最小路徑和：暴力搜尋 */
func minPathSumDFS(grid [][]int, i, j int) int {
	// 若為左上角單元格，則終止搜尋
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 若行列索引越界，則返回 +∞ 代價
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
	up := minPathSumDFS(grid, i-1, j)
	left := minPathSumDFS(grid, i, j-1)
	// 返回從左上角到 (i, j) 的最小路徑代價
	return int(math.Min(float64(left), float64(up))) + grid[i][j]
}

/* 最小路徑和：記憶化搜尋 */
func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
	// 若為左上角單元格，則終止搜尋
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 若行列索引越界，則返回 +∞ 代價
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 若已有記錄，則直接返回
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 左邊和上邊單元格的最小路徑代價
	up := minPathSumDFSMem(grid, mem, i-1, j)
	left := minPathSumDFSMem(grid, mem, i, j-1)
	// 記錄並返回左上角到 (i, j) 的最小路徑代價
	mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
	return mem[i][j]
}

/* 最小路徑和：動態規劃 */
func minPathSumDP(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// 初始化 dp 表
	dp := make([][]int, n)
	for i := 0; i < n; i++ {
		dp[i] = make([]int, m)
	}
	dp[0][0] = grid[0][0]
	// 狀態轉移：首行
	for j := 1; j < m; j++ {
		dp[0][j] = dp[0][j-1] + grid[0][j]
	}
	// 狀態轉移：首列
	for i := 1; i < n; i++ {
		dp[i][0] = dp[i-1][0] + grid[i][0]
	}
	// 狀態轉移：其餘行和列
	for i := 1; i < n; i++ {
		for j := 1; j < m; j++ {
			dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
		}
	}
	return dp[n-1][m-1]
}

/* 最小路徑和：空間最佳化後的動態規劃 */
func minPathSumDPComp(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// 初始化 dp 表
	dp := make([]int, m)
	// 狀態轉移：首行
	dp[0] = grid[0][0]
	for j := 1; j < m; j++ {
		dp[j] = dp[j-1] + grid[0][j]
	}
	// 狀態轉移：其餘行和列
	for i := 1; i < n; i++ {
		// 狀態轉移：首列
		dp[0] = dp[0] + grid[i][0]
		// 狀態轉移：其餘列
		for j := 1; j < m; j++ {
			dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
		}
	}
	return dp[m-1]
}
