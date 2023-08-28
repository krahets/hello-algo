// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 爬楼梯：动态规划 */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// 初始化 dp 表，用于存储子问题的解
	dp := make([]int, n+1)
	// 初始状态：预设最小子问题的解
	dp[1] = 1
	dp[2] = 2
	// 状态转移：从较小子问题逐步求解较大子问题
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* 爬楼梯：空间优化后的动态规划 */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// 状态转移：从较小子问题逐步求解较大子问题
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
