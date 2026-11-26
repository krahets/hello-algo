// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* バックトラッキングによる部分和問題 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の要素の和が target に等しくなったら解を記録する
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を調べる
	// 枝刈り 2：start から調べて部分集合の重複を防ぐ
	// 枝刈り 3：start から調べて同じ要素を二度選ばないようにする
	for i := start; i < len(*choices); i++ {
		// 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
		// 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
		if target-(*choices)[i] < 0 {
			break
		}
		// 枝刈り 4：左隣の要素と値が等しければ、探索の枝が重複するので飛ばす
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 試行：選択して target と start を更新する
		*state = append(*state, (*choices)[i])
		// 次の選択に進む
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 後戻り：選択を取り消し、元の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分和問題 II を解く */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	sort.Ints(nums)         // nums をソートする
	start := 0              // 走査の開始位置
	res := make([][]int, 0) // 結果のリスト（部分集合のリスト）
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
