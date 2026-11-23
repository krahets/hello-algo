// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Coin change: dynamic programming */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Initialize the dp table
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// State transitions: first row and first column
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// State transitions: remaining rows and columns
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If the coin exceeds the current target amount a, do not choose coin i
				dp[i][a] = dp[i-1][a]
			} else {
				// Take the smaller result of not choosing and choosing coin i
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* Coin change: dynamic programming */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Initialize the dp table
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// State transitions
	for i := 1; i <= n; i++ {
		// Traverse in increasing order
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If the coin exceeds the current target amount a, do not choose coin i
				dp[a] = dp[a]
			} else {
				// Take the smaller result of not choosing and choosing coin i
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
