// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：すべての順列 I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 状態の長さが要素数と等しくなったら、解を記録する
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// すべての選択肢を走査する
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 枝刈り：同じ要素を繰り返し選んではならない
		if !(*selected)[i] {
			// 試行：選択を行い、状態を更新する
			(*selected)[i] = true
			*state = append(*state, choice)
			// 次の選択に進む
			backtrackI(state, choices, selected, res)
			// 復元：選択を取り消し、以前の状態に戻す
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* すべての順列 I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
