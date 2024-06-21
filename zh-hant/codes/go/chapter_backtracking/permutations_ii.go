// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：全排列 II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 當狀態長度等於元素數量時，記錄解
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// 走訪所有選擇
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 剪枝：不允許重複選擇元素 且 不允許重複選擇相等元素
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// 嘗試：做出選擇，更新狀態
			// 記錄選擇過的元素值
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// 進行下一輪選擇
			backtrackII(state, choices, selected, res)
			// 回退：撤銷選擇，恢復到之前的狀態
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* 全排列 II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
