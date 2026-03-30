// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 ナップサック：総当たり探索 */
func knapsackDFS(wgt, val []int, i, c int) int {
	// すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
	if i == 0 || c == 0 {
		return 0
	}
	// ナップサック容量を超える場合は、入れない選択しかできない
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// 品物 i を入れない場合と入れる場合の最大価値を計算する
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// 2つの案のうち価値が大きいほうを返す
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 ナップサック：メモ化探索 */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
	if i == 0 || c == 0 {
		return 0
	}
	// 既に記録があればそのまま返す
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// ナップサック容量を超える場合は、入れない選択しかできない
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// 品物 i を入れない場合と入れる場合の最大価値を計算する
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// 2つの案のうち価値が大きいほうを返す
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 ナップサック：動的計画法 */
func knapsackDP(wgt, val []int, cap int) int {
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
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp テーブルを初期化
	dp := make([]int, cap+1)
	// 状態遷移
	for i := 1; i <= n; i++ {
		// 逆順に走査する
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// 品物 i を選ばない場合と選ぶ場合の大きい方
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
