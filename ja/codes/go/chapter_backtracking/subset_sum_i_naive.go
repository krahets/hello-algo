// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキングによる部分和問題 I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の要素の和が target に等しくなったら解を記録する
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を調べる
	for i := 0; i < len(*choices); i++ {
		// 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
		if total+(*choices)[i] > target {
			continue
		}
		// 試行：選択して要素の和 total を更新する
		*state = append(*state, (*choices)[i])
		// 次の選択に進む
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// 後戻り：選択を取り消し、元の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	total := 0              // 部分和
	res := make([][]int, 0) // 結果のリスト（部分集合のリスト）
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
