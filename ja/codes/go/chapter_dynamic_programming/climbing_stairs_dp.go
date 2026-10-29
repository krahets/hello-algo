// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 階段の上り方：動的計画法 */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// 部分問題の解を格納する dp テーブルを初期化する
	dp := make([]int, n+1)
	// 初期状態：最小の部分問題の解を設定する
	dp[1] = 1
	dp[2] = 2
	// 状態遷移：小さな部分問題から順に大きな部分問題を解く
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* 階段の上り方：空間を最適化した動的計画法 */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// 状態遷移：小さな部分問題から順に大きな部分問題を解く
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
