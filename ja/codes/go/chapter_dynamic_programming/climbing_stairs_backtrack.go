// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* バックトラック */
func backtrack(choices []int, state, n int, res []int) {
	// n 段目に着いたら、登り方の数を 1 増やす
	if state == n {
		res[0] = res[0] + 1
	}
	// すべての選択肢を調べる
	for _, choice := range choices {
		// 枝刈り：n 段目を越えないようにする
		if state+choice > n {
			continue
		}
		// 選択肢を試し、状態を更新する
		backtrack(choices, state+choice, n, res)
		// 選択を取り消す
	}
}

/* 階段の登り方：バックトラック */
func climbingStairsBacktrack(n int) int {
	// 1 段または 2 段登れる
	choices := []int{1, 2}
	// 0 段目から登り始める
	state := 0
	res := make([]int, 1)
	// res[0] に登り方の数を記録する
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
