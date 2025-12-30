// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking algorithm: Subset sum I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// When the subset sum equals target, record the solution
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Traverse all choices
	for i := 0; i < len(*choices); i++ {
		// Pruning: if the subset sum exceeds target, skip this choice
		if total+(*choices)[i] > target {
			continue
		}
		// Attempt: make choice, update element sum total
		*state = append(*state, (*choices)[i])
		// Proceed to the next round of selection
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Backtrack: undo choice, restore to previous state
		*state = (*state)[:len(*state)-1]
	}
}

/* Solve subset sum I (including duplicate subsets) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // State (subset)
	total := 0              // Subset sum
	res := make([][]int, 0) // Result list (subset list)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
