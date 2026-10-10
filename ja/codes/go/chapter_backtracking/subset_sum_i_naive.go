// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：部分和 I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の和が target に等しければ、解を記録
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を走査
	for i := 0; i < len(*choices); i++ {
		// 枝刈り：部分和が target を超える場合はその選択をスキップする
		if total+(*choices)[i] > target {
			continue
		}
		// 試行：選択を行い、要素と total を更新する
		*state = append(*state, (*choices)[i])
		// 次の選択へ進む
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// バックトラック：選択を取り消し、前の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分和 I を解く（重複部分集合を含む） */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	total := 0              // 部分和
	res := make([][]int, 0) // 結果リスト（部分集合のリスト）
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
