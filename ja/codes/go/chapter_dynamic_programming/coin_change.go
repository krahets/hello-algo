// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* コイン両替：動的計画法 */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// dp テーブルを初期化
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// 状態遷移：先頭行と先頭列
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// 状態遷移: 残りの行と列
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 目標金額を超えるなら硬貨 i は選ばない
				dp[i][a] = dp[i-1][a]
			} else {
				// 硬貨 i を選ばない場合と選ぶ場合の小さい方
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* コイン両替：動的計画法 */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// dp テーブルを初期化
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// 状態遷移
	for i := 1; i <= n; i++ {
		// 順方向に走査する
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 目標金額を超えるなら硬貨 i は選ばない
				dp[a] = dp[a]
			} else {
				// 硬貨 i を選ばない場合と選ぶ場合の小さい方
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
