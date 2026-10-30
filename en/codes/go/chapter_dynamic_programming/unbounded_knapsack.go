// File: unbounded_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Unbounded knapsack: dynamic programming */
func unboundedKnapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize the dp table
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// State transitions
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// If item i exceeds the remaining capacity, do not choose it
				dp[i][c] = dp[i-1][c]
			} else {
				// Take the larger value obtained by excluding and including item i
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* Unbounded knapsack: space-optimized dynamic programming */
func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize the dp table
	dp := make([]int, cap+1)
	// State transitions
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// If item i exceeds the remaining capacity, do not choose it
				dp[c] = dp[c]
			} else {
				// Take the larger value obtained by excluding and including item i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
