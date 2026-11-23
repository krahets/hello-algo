// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: subset sum I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// Record a solution when the subset sum equals target
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Iterate over all choices
	for i := 0; i < len(*choices); i++ {
		// Prune: skip this choice if the subset sum would exceed target
		if total+(*choices)[i] > target {
			continue
		}
		// Try: make a choice and update the sum total
		*state = append(*state, (*choices)[i])
		// Proceed to the next choice
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Backtrack: undo the choice and restore the previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum I (with duplicate subsets) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // State (subset)
	total := 0              // Subset sum
	res := make([][]int, 0) // Result list (list of subsets)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
