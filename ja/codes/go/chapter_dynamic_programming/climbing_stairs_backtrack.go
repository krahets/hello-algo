// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* バックトラッキング */
func backtrack(choices []int, state, n int, res []int) {
	// n 段目に到達したら、方法の数を 1 増やす
	if state == n {
		res[0] = res[0] + 1
	}
	// すべての選択肢を走査する
	for _, choice := range choices {
		// 枝刈り：n 段目を越えてはならない
		if state+choice > n {
			continue
		}
		// 試行：選択を行い、状態を更新する
		backtrack(choices, state+choice, n, res)
		// 復元
	}
}

/* 階段の上り方：バックトラッキング */
func climbingStairsBacktrack(n int) int {
	// 1 段または 2 段上ることを選択できる
	choices := []int{1, 2}
	// 0 段目から上り始める
	state := 0
	res := make([]int, 1)
	// res[0] に方法の数を記録する
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
