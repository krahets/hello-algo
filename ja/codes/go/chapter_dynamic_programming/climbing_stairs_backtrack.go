// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* バックトラッキング */
func backtrack(choices []int, state, n int, res []int) {
	// 第 n 段に到達したら、方法数を 1 増やす
	if state == n {
		res[0] = res[0] + 1
	}
	// すべての選択肢を走査
	for _, choice := range choices {
		// 枝刈り: 第 n 段を超えないようにする
		if state+choice > n {
			continue
		}
		// 試行: 選択を行い、状態を更新
		backtrack(choices, state+choice, n, res)
		// バックトラック
	}
}

/* 階段登り：バックトラッキング */
func climbingStairsBacktrack(n int) int {
	// 1 段または 2 段上ることを選べる
	choices := []int{1, 2}
	// 第 0 段から上り始める
	state := 0
	res := make([]int, 1)
	// res[0] を使って方法数を記録する
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
