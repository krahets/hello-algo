// File: coin_change_ii.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* コイン両替 II：動的計画法 */
func coinChangeIIDP(coins []int, amt int) int {
	n := len(coins)
	// dp テーブルを初期化
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// 先頭列を初期化する
	for i := 0; i <= n; i++ {
		dp[i][0] = 1
	}
	// 状態遷移: 残りの行と列
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 目標金額を超えるなら硬貨 i は選ばない
				dp[i][a] = dp[i-1][a]
			} else {
				// コイン i を選ばない場合と選ぶ場合の和
				dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
			}
		}
	}
	return dp[n][amt]
}

/* コイン両替 II：空間最適化した動的計画法 */
func coinChangeIIDPComp(coins []int, amt int) int {
	n := len(coins)
	// dp テーブルを初期化
	dp := make([]int, amt+1)
	dp[0] = 1
	// 状態遷移
	for i := 1; i <= n; i++ {
		// 順方向に走査する
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 目標金額を超えるなら硬貨 i は選ばない
				dp[a] = dp[a]
			} else {
				// コイン i を選ばない場合と選ぶ場合の和
				dp[a] = dp[a] + dp[a-coins[i-1]]
			}
		}
	}
	return dp[amt]
}
