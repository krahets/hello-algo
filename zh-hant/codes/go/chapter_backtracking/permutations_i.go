// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：全排列 I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 當狀態長度等於元素數量時，記錄解
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// 走訪所有選擇
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 剪枝：不允許重複選擇元素
		if !(*selected)[i] {
			// 嘗試：做出選擇，更新狀態
			(*selected)[i] = true
			*state = append(*state, choice)
			// 進行下一輪選擇
			backtrackI(state, choices, selected, res)
			// 回退：撤銷選擇，恢復到之前的狀態
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* 全排列 I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
