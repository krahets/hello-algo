// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Climbing stairs: Dynamic programming */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// Initialize dp table, used to store solutions to subproblems
	dp := make([]int, n+1)
	// Initial state: preset the solution to the smallest subproblem
	dp[1] = 1
	dp[2] = 2
	// State transition: gradually solve larger subproblems from smaller ones
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* Climbing stairs: Space-optimized dynamic programming */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// State transition: gradually solve larger subproblems from smaller ones
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
