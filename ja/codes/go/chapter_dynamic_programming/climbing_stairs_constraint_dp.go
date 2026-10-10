// File: climbing_stairs_constraint_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 制約付き階段登り：動的計画法 */
func climbingStairsConstraintDP(n int) int {
	if n == 1 || n == 2 {
		return 1
	}
	// 部分問題の解を保存するために dp テーブルを初期化
	dp := make([][3]int, n+1)
	// 初期状態：最小部分問題の解をあらかじめ設定
	dp[1][1] = 1
	dp[1][2] = 0
	dp[2][1] = 0
	dp[2][2] = 1
	// 状態遷移：小さい部分問題から大きい部分問題へ順に解く
	for i := 3; i <= n; i++ {
		dp[i][1] = dp[i-1][2]
		dp[i][2] = dp[i-2][1] + dp[i-2][2]
	}
	return dp[n][1] + dp[n][2]
}
