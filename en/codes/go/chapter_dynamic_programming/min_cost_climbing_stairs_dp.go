// File: min_cost_climbing_stairs_dp.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Minimum cost to climb stairs: dynamic programming */
func minCostClimbingStairsDP(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// Initialize the dp table to store subproblem solutions
	dp := make([]int, n+1)
	// Initial states: set the solutions to the smallest subproblems
	dp[1] = cost[1]
	dp[2] = cost[2]
	// State transitions: solve progressively larger subproblems using smaller ones
	for i := 3; i <= n; i++ {
		dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
	}
	return dp[n]
}

/* Minimum cost to climb stairs: space-optimized dynamic programming */
func minCostClimbingStairsDPComp(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// Initial states: set the solutions to the smallest subproblems
	a, b := cost[1], cost[2]
	// State transitions: solve progressively larger subproblems using smaller ones
	for i := 3; i <= n; i++ {
		tmp := b
		b = min(a, tmp) + cost[i]
		a = tmp
	}
	return b
}
