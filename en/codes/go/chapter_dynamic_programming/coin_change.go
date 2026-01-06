// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Coin change: Dynamic programming */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Initialize dp table
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// State transition: first row and first column
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// State transition: rest of the rows and columns
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If exceeds target amount, don't select coin i
				dp[i][a] = dp[i-1][a]
			} else {
				// The smaller value between not selecting and selecting coin i
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* Coin change: Dynamic programming */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Initialize dp table
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// State transition
	for i := 1; i <= n; i++ {
		// Traverse in forward order
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// If exceeds target amount, don't select coin i
				dp[a] = dp[a]
			} else {
				// The smaller value between not selecting and selecting coin i
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
