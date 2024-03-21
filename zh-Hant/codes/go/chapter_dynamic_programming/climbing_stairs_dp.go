// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 爬樓梯：動態規劃 */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// 初始化 dp 表，用於儲存子問題的解
	dp := make([]int, n+1)
	// 初始狀態：預設最小子問題的解
	dp[1] = 1
	dp[2] = 2
	// 狀態轉移：從較小子問題逐步求解較大子問題
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* 爬樓梯：空間最佳化後的動態規劃 */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// 狀態轉移：從較小子問題逐步求解較大子問題
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
