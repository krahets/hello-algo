// File: subset_sum_i.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Backtracking: subset sum I */
func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
	// Record a solution when the subset sums to target
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Try each choice
	// Pruning rule 2: start at start to avoid duplicate subsets
	for i := start; i < len(*choices); i++ {
		// Pruning rule 1: break if the subset sum would exceed target
		// The array is sorted, so later elements are at least as large and would also take the sum over target
		if target-(*choices)[i] < 0 {
			break
		}
		// Make a choice and update target and start
		*state = append(*state, (*choices)[i])
		// Make the next choice
		backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
		// Backtrack: undo the choice to restore the previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum I */
func subsetSumI(nums []int, target int) [][]int {
	state := make([]int, 0) // State (current subset)
	sort.Ints(nums)         // Sort nums
	start := 0              // Starting index
	res := make([][]int, 0) // Results (list of subsets)
	backtrackSubsetSumI(start, target, &state, &nums, &res)
	return res
}
