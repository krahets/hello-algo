// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：部分集合和 I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の和が target と等しくなったら、解を記録する
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を走査する
	for i := 0; i < len(*choices); i++ {
		// 枝刈り：部分集合の和が target を超える場合、この選択をスキップする
		if total+(*choices)[i] > target {
			continue
		}
		// 試行：選択を行い、要素の和 total を更新する
		*state = append(*state, (*choices)[i])
		// 次の選択に進む
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// 復元：選択を取り消し、以前の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分集合和 I を解く（重複した部分集合を含む） */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	total := 0              // 部分集合和
	res := make([][]int, 0) // 結果リスト（部分集合のリスト）
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
