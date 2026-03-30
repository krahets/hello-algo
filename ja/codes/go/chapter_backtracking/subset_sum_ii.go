// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* バックトラッキング：部分和 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 部分集合の和が target に等しければ、解を記録
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// すべての選択肢を走査
	// 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
	// 枝刈り 3: start から走査し、同じ要素の重複選択を避ける
	for i := start; i < len(*choices); i++ {
		// 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
		// 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
		if target-(*choices)[i] < 0 {
			break
		}
		// 枝刈り4：この要素が左隣の要素と等しければ、その探索分岐は重複しているためスキップする
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 試す：選択を行い、target と start を更新
		*state = append(*state, (*choices)[i])
		// 次の選択へ進む
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// バックトラック：選択を取り消し、前の状態に戻す
		*state = (*state)[:len(*state)-1]
	}
}

/* 部分和 II を解く */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 状態（部分集合）
	sort.Ints(nums)         // nums をソート
	start := 0              // 開始点を走査
	res := make([][]int, 0) // 結果リスト（部分集合のリスト）
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
