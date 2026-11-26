// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: permutations II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Record a solution when the state contains all the elements
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Try each choice
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Skip elements already in use and values already tried at this level
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Make a choice and update the state
			// Track values already tried
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Make the next choice
			backtrackII(state, choices, selected, res)
			// Backtrack: undo the choice to restore the previous state
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Permutations II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
