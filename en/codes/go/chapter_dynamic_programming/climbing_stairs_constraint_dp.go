// File: climbing_stairs_constraint_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Climbing stairs with constraints: dynamic programming */
func climbingStairsConstraintDP(n int) int {
	if n == 1 || n == 2 {
		return 1
	}
	// Initialize the dp table to store subproblem solutions
	dp := make([][3]int, n+1)
	// Initial states: set the solutions to the smallest subproblems
	dp[1][1] = 1
	dp[1][2] = 0
	dp[2][1] = 0
	dp[2][2] = 1
	// State transitions: solve progressively larger subproblems using smaller ones
	for i := 3; i <= n; i++ {
		dp[i][1] = dp[i-1][2]
		dp[i][2] = dp[i-2][1] + dp[i-2][2]
	}
	return dp[n][1] + dp[n][2]
}
