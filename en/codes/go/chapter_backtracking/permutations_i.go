// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: permutations I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Record a solution when the state length equals the number of elements
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Iterate over all choices
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Prune: do not choose an element more than once
		if !(*selected)[i] {
			// Try: make a choice and update the state
			(*selected)[i] = true
			*state = append(*state, choice)
			// Proceed to the next choice
			backtrackI(state, choices, selected, res)
			// Backtrack: undo the choice and restore the previous state
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Permutations I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
