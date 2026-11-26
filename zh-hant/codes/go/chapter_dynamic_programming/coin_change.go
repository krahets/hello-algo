// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 零錢兌換：動態規劃 */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// 初始化 dp 表
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// 狀態轉移：第一列和第一欄
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// 狀態轉移：其餘各列與各欄
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 若面額超過目標金額，就不選硬幣 i
				dp[i][a] = dp[i-1][a]
			} else {
				// 取不選與選取硬幣 i 兩種情況中的較小值
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* 零錢兌換：動態規劃 */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// 初始化 dp 表
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// 狀態轉移
	for i := 1; i <= n; i++ {
		// 正向走訪
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 若面額超過目標金額，就不選硬幣 i
				dp[a] = dp[a]
			} else {
				// 取不選與選取硬幣 i 兩種情況中的較小值
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
