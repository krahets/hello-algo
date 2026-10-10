// File: unbounded_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 完全ナップサック問題：動的計画法 */
func unboundedKnapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp テーブルを初期化
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// 状態遷移
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// ナップサック容量を超えるなら品物 i は選ばない
				dp[i][c] = dp[i-1][c]
			} else {
				// 品物 i を選ばない場合と選ぶ場合の大きい方
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 完全ナップサック問題：空間最適化後の動的計画法 */
func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp テーブルを初期化
	dp := make([]int, cap+1)
	// 状態遷移
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// ナップサック容量を超えるなら品物 i は選ばない
				dp[c] = dp[c]
			} else {
				// 品物 i を選ばない場合と選ぶ場合の大きい方
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
