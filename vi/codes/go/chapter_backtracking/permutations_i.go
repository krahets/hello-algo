// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking algorithm: Permutations I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// When the state length equals the number of elements, record the solution
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Traverse all choices
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Pruning: do not allow repeated selection of elements
		if !(*selected)[i] {
			// Attempt: make choice, update state
			(*selected)[i] = true
			*state = append(*state, choice)
			// Proceed to the next round of selection
			backtrackI(state, choices, selected, res)
			// Backtrack: undo choice, restore to previous state
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
