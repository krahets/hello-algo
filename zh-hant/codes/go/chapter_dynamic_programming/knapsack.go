// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 背包：暴力搜尋 */
func knapsackDFS(wgt, val []int, i, c int) int {
	// 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
	if i == 0 || c == 0 {
		return 0
	}
	// 若重量超過背包容量，就只能選擇不放入
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// 分別計算不放入與放入物品 i 可取得的最大價值
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// 回傳兩種選法中較大的價值
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 背包：記憶化搜尋 */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
	if i == 0 || c == 0 {
		return 0
	}
	// 若已有紀錄，直接回傳該值
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// 若重量超過背包容量，就只能選擇不放入
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// 分別計算不放入與放入物品 i 可取得的最大價值
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// 回傳兩種選法中較大的價值
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 背包：動態規劃 */
func knapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// 初始化 dp 表
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// 狀態轉移
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// 若重量超過背包容量，就不選物品 i
				dp[i][c] = dp[i-1][c]
			} else {
				// 取不選與選取物品 i 兩種情況中的較大值
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 背包：空間最佳化後的動態規劃 */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// 初始化 dp 表
	dp := make([]int, cap+1)
	// 狀態轉移
	for i := 1; i <= n; i++ {
		// 反向走訪
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// 取不選與選取物品 i 兩種情況中的較大值
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
