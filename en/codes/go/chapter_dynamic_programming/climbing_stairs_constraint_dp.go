// File: climbing_stairs_constraint_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Climbing stairs with constraint: Dynamic programming */
func climbingStairsConstraintDP(n int) int {
	if n == 1 || n == 2 {
		return 1
	}
	// Initialize dp table, used to store solutions to subproblems
	dp := make([][3]int, n+1)
	// Initial state: preset the solution to the smallest subproblem
	dp[1][1] = 1
	dp[1][2] = 0
	dp[2][1] = 0
	dp[2][2] = 1
	// State transition: gradually solve larger subproblems from smaller ones
	for i := 3; i <= n; i++ {
		dp[i][1] = dp[i-1][2]
		dp[i][2] = dp[i-2][1] + dp[i-2][2]
	}
	return dp[n][1] + dp[n][2]
}
