// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Backtracking algorithm: Subset sum II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// When the subset sum equals target, record the solution
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Traverse all choices
	// Pruning 2: start traversing from start to avoid generating duplicate subsets
	// Pruning 3: start traversing from start to avoid repeatedly selecting the same element
	for i := start; i < len(*choices); i++ {
		// Pruning 1: if the subset sum exceeds target, end the loop directly
		// This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
		if target-(*choices)[i] < 0 {
			break
		}
		// Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// Attempt: make choice, update target, start
		*state = append(*state, (*choices)[i])
		// Proceed to the next round of selection
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// Backtrack: undo choice, restore to previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // State (subset)
	sort.Ints(nums)         // Sort nums
	start := 0              // Start point for traversal
	res := make([][]int, 0) // Result list (subset list)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
