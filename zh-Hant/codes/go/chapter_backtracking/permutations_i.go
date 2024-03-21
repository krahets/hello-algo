// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯算法：全排列 I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 当状态长度等于元素数量时，记录解
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// 遍历所有选择
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 剪枝：不允许重复选择元素
		if !(*selected)[i] {
			// 尝试：做出选择，更新状态
			(*selected)[i] = true
			*state = append(*state, choice)
			// 进行下一轮选择
			backtrackI(state, choices, selected, res)
			// 回退：撤销选择，恢复到之前的状态
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
