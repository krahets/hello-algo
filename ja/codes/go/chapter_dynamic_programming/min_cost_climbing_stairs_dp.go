// File: min_cost_climbing_stairs_dp.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 階段登りの最小コスト：動的計画法 */
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
	// 部分問題の解を保存するために dp テーブルを初期化
	dp := make([]int, n+1)
	// 初期状態：最小部分問題の解をあらかじめ設定
	dp[1] = cost[1]
	dp[2] = cost[2]
	// 状態遷移：小さい部分問題から大きい部分問題へ順に解く
	for i := 3; i <= n; i++ {
		dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
	}
	return dp[n]
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
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
	// 初期状態：最小部分問題の解をあらかじめ設定
	a, b := cost[1], cost[2]
	// 状態遷移：小さい部分問題から大きい部分問題へ順に解く
	for i := 3; i <= n; i++ {
		tmp := b
		b = min(a, tmp) + cost[i]
		a = tmp
	}
	return b
}
