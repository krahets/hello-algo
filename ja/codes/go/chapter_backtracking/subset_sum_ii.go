// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* バックトラッキング：部分集合和 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の和が target と等しくなったら、解を記録する
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を走査する
	// 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
	// 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
	for i := start; i < len(*choices); i++ {
		// 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
		// 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
		if target-(*choices)[i] < 0 {
			break
		}
		// 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 試行：選択を行い、target, start を更新する
		*state = append(*state, (*choices)[i])
		// 次の選択に進む
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 復元：選択を取り消し、以前の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分集合和 II を解く */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	sort.Ints(nums)         // nums をソートする
	start := 0              // 走査の開始位置
	res := make([][]int, 0) // 結果リスト（部分集合のリスト）
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
