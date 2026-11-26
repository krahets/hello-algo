// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキングによる全順列 I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 状態の長さが要素数に達したら解を記録する
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// すべての選択肢を調べる
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 枝刈り：同じ要素は二度選ばない
		if !(*selected)[i] {
			// 試行：選択して状態を更新する
			(*selected)[i] = true
			*state = append(*state, choice)
			// 次の選択に進む
			backtrackI(state, choices, selected, res)
			// 後戻り：選択を取り消し、元の状態に戻す
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* 全順列 I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
