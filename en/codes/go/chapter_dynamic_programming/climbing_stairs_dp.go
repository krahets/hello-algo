// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Climbing stairs: dynamic programming */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// Initialize the dp table to store subproblem solutions
	dp := make([]int, n+1)
	// Initial states: set the solutions to the smallest subproblems
	dp[1] = 1
	dp[2] = 2
	// State transitions: solve progressively larger subproblems using smaller ones
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* Climbing stairs: space-optimized dynamic programming */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// State transitions: solve progressively larger subproblems using smaller ones
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
