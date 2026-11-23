// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：すべての順列 II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 状態の長さが要素数と等しくなったら、解を記録する
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// すべての選択肢を走査する
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 枝刈り：同じ要素の再選択も、等しい値を持つ要素の重複選択も許可しない
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// 試行：選択を行い、状態を更新する
			// 選択済みの要素の値を記録する
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// 次の選択に進む
			backtrackII(state, choices, selected, res)
			// 復元：選択を取り消し、以前の状態に戻す
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* すべての順列 II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
