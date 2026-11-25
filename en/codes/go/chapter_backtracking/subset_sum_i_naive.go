// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: subset sum I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// Record a solution when the subset sums to target
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Try each choice
	for i := 0; i < len(*choices); i++ {
		// Prune: skip choices that would take the subset sum over target
		if total+(*choices)[i] > target {
			continue
		}
		// Make a choice and update the running sum total
		*state = append(*state, (*choices)[i])
		// Make the next choice
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Backtrack: undo the choice to restore the previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum I (including duplicate subsets) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // State (current subset)
	total := 0              // Subset sum
	res := make([][]int, 0) // Results (list of subsets)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
