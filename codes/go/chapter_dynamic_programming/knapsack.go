// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 背包：暴力搜索 */
func knapsackDFS(wgt, val []int, i, c int) int {
	// 若已选完所有物品或背包无剩余容量，则返回价值 0
	if i == 0 || c == 0 {
		return 0
	}
	// 若超过背包容量，则只能选择不放入背包
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// 计算不放入和放入物品 i 的最大价值
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// 返回两种方案中价值更大的那一个
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 背包：记忆化搜索 */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// 若已选完所有物品或背包无剩余容量，则返回价值 0
	if i == 0 || c == 0 {
		return 0
	}
	// 若已有记录，则直接返回
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// 若超过背包容量，则只能选择不放入背包
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// 计算不放入和放入物品 i 的最大价值
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// 返回两种方案中价值更大的那一个
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 背包：动态规划 */
func knapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// 初始化 dp 表
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// 状态转移
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// 若超过背包容量，则不选物品 i
				dp[i][c] = dp[i-1][c]
			} else {
				// 不选和选物品 i 这两种方案的较大值
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 背包：空间优化后的动态规划 */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// 初始化 dp 表
	dp := make([]int, cap+1)
	// 状态转移
	for i := 1; i <= n; i++ {
		// 倒序遍历
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// 不选和选物品 i 这两种方案的较大值
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
