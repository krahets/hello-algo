// File: min_path_sum.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 最小経路和：全探索 */
func minPathSumDFS(grid [][]int, i, j int) int {
	// 左上のセルなら探索を終了する
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 行または列のインデックスが範囲外なら、コスト +∞ を返す
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
	up := minPathSumDFS(grid, i-1, j)
	left := minPathSumDFS(grid, i, j-1)
	// 左上隅から (i, j) までの最小経路コストを返す
	return int(math.Min(float64(left), float64(up))) + grid[i][j]
}

/* 最小経路和：メモ化探索 */
func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
	// 左上のセルなら探索を終了する
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 行または列のインデックスが範囲外なら、コスト +∞ を返す
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 既に記録があればそのまま返す
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 左と上のセルからの最小経路コスト
	up := minPathSumDFSMem(grid, mem, i-1, j)
	left := minPathSumDFSMem(grid, mem, i, j-1)
	// 左上から (i, j) までの最小経路コストを記録して返す
	mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
	return mem[i][j]
}

/* 最小経路和：動的計画法 */
func minPathSumDP(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// dp テーブルを初期化
	dp := make([][]int, n)
	for i := 0; i < n; i++ {
		dp[i] = make([]int, m)
	}
	dp[0][0] = grid[0][0]
	// 状態遷移：先頭行
	for j := 1; j < m; j++ {
		dp[0][j] = dp[0][j-1] + grid[0][j]
	}
	// 状態遷移：先頭列
	for i := 1; i < n; i++ {
		dp[i][0] = dp[i-1][0] + grid[i][0]
	}
	// 状態遷移: 残りの行と列
	for i := 1; i < n; i++ {
		for j := 1; j < m; j++ {
			dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
		}
	}
	return dp[n-1][m-1]
}

/* 最小経路和：空間最適化後の動的計画法 */
func minPathSumDPComp(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// dp テーブルを初期化
	dp := make([]int, m)
	// 状態遷移：先頭行
	dp[0] = grid[0][0]
	for j := 1; j < m; j++ {
		dp[j] = dp[j-1] + grid[0][j]
	}
	// 状態遷移: 残りの行と列
	for i := 1; i < n; i++ {
		// 状態遷移：先頭列
		dp[0] = dp[0] + grid[i][0]
		// 状態遷移：残りの列
		for j := 1; j < m; j++ {
			dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
		}
	}
	return dp[m-1]
}
