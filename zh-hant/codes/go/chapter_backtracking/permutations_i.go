// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：全排列 I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 當狀態長度等於元素個數時，記錄此解
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// 逐一檢查所有選項
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 剪枝：不可重複選取同一個元素
		if !(*selected)[i] {
			// 嘗試：做出選擇並更新狀態
			(*selected)[i] = true
			*state = append(*state, choice)
			// 進入下一輪選擇
			backtrackI(state, choices, selected, res)
			// 回溯：撤銷選擇，還原先前的狀態
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
