// File: climbing_stairs_constraint_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 有限制的爬樓梯問題：動態規劃 */
func climbingStairsConstraintDP(n int) int {
	if n == 1 || n == 2 {
		return 1
	}
	// 初始化 dp 表，用來儲存子問題的解
	dp := make([][3]int, n+1)
	// 初始狀態：設定最小子問題的解
	dp[1][1] = 1
	dp[1][2] = 0
	dp[2][1] = 0
	dp[2][2] = 1
	// 狀態轉移：從較小的子問題逐步求出較大子問題的解
	for i := 3; i <= n; i++ {
		dp[i][1] = dp[i-1][2]
		dp[i][2] = dp[i-2][1] + dp[i-2][2]
	}
	return dp[n][1] + dp[n][2]
}
