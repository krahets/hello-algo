// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* 回溯演算法：子集和 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 子集和等於 target 時，記錄解
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 走訪所有選擇
	// 剪枝二：從 start 開始走訪，避免生成重複子集
	// 剪枝三：從 start 開始走訪，避免重複選擇同一元素
	for i := start; i < len(*choices); i++ {
		// 剪枝一：若子集和超過 target ，則直接結束迴圈
		// 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
		if target-(*choices)[i] < 0 {
			break
		}
		// 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 嘗試：做出選擇，更新 target, start
		*state = append(*state, (*choices)[i])
		// 進行下一輪選擇
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 回退：撤銷選擇，恢復到之前的狀態
		*state = (*state)[:len(*state)-1]
	}
}

/* 求解子集和 II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 狀態（子集）
	sort.Ints(nums)         // 對 nums 進行排序
	start := 0              // 走訪起始點
	res := make([][]int, 0) // 結果串列（子集串列）
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
