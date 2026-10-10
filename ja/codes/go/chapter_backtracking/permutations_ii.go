// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：順列 II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 状態の長さが要素数に等しければ、解を記録
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// すべての選択肢を走査
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 枝刈り：要素の重複選択を許可せず、同値要素の重複選択も許可しない
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// 試す: 選択を行って状態を更新
			// 選択済みの要素値を記録
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// 次の選択へ進む
			backtrackII(state, choices, selected, res)
			// バックトラック：選択を取り消し、前の状態に戻す
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* 全順列 II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
