// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 knapsack: brute-force search */
func knapsackDFS(wgt, val []int, i, c int) int {
	// If all items have been considered or no capacity remains, return value 0
	if i == 0 || c == 0 {
		return 0
	}
	// If the item exceeds the remaining capacity, it must be excluded
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// Calculate the maximum values obtained by excluding and including item i
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// Return the larger value from the two choices
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 knapsack: memoized search */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// If all items have been considered or no capacity remains, return value 0
	if i == 0 || c == 0 {
		return 0
	}
	// If a result has already been recorded, return it directly
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// If the item exceeds the remaining capacity, it must be excluded
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// Calculate the maximum values obtained by excluding and including item i
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// Return the larger value from the two choices
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 knapsack: dynamic programming */
func knapsackDP(wgt, val []int, cap int) int {
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
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 knapsack: space-optimized dynamic programming */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Initialize the dp table
	dp := make([]int, cap+1)
	// State transitions
	for i := 1; i <= n; i++ {
		// Traverse in decreasing order
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// Take the larger value obtained by excluding and including item i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
