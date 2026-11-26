// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* 回溯演算法：子集和 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 子集總和達到目標時，記錄此解
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 逐一檢查所有選項
	// 剪枝二：從 start 開始走訪，避免產生重複子集
	// 剪枝三：從 start 開始走訪，避免重複選取同一個元素
	for i := start; i < len(*choices); i++ {
		// 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
		// 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
		if target-(*choices)[i] < 0 {
			break
		}
		// 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 嘗試：做出選擇，更新 target 和 start
		*state = append(*state, (*choices)[i])
		// 進入下一輪選擇
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 回溯：撤銷選擇，還原先前的狀態
		*state = (*state)[:len(*state)-1]
	}
}

/* 求解子集和 II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 狀態（子集）
	sort.Ints(nums)         // 將 nums 排序
	start := 0              // 走訪的起點
	res := make([][]int, 0) // 結果串列（子集串列）
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
