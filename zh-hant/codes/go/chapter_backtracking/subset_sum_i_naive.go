// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：子集和 I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// 子集和等於 target 時，記錄解
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 走訪所有選擇
	for i := 0; i < len(*choices); i++ {
		// 剪枝：若子集和超過 target ，則跳過該選擇
		if total+(*choices)[i] > target {
			continue
		}
		// 嘗試：做出選擇，更新元素和 total
		*state = append(*state, (*choices)[i])
		// 進行下一輪選擇
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// 回退：撤銷選擇，恢復到之前的狀態
		*state = (*state)[:len(*state)-1]
	}
}

/* 求解子集和 I（包含重複子集） */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // 狀態（子集）
	total := 0              // 子集和
	res := make([][]int, 0) // 結果串列（子集串列）
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
