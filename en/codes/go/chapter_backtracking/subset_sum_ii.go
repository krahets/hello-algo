// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Backtracking: subset sum II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// Record a solution when the subset reaches the original target sum (remaining target is zero)
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Iterate over all choices
	// Pruning 2: iterate from start to avoid generating duplicate subsets
	// Pruning 3: start after the previously chosen index to avoid choosing the same element again
	for i := start; i < len(*choices); i++ {
		// Pruning 1: exit the loop if this choice exceeds the remaining target
		// The array is sorted, so later elements are at least as large and also exceed the remaining target
		if target-(*choices)[i] < 0 {
			break
		}
		// Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// Try: make a choice and update target and start
		*state = append(*state, (*choices)[i])
		// Proceed to the next choice
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// Backtrack: undo the choice and restore the previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // State (subset)
	sort.Ints(nums)         // Sort nums
	start := 0              // Starting index for iteration
	res := make([][]int, 0) // Result list (list of subsets)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
