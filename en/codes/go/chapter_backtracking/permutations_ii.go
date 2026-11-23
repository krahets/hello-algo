// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: permutations II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Record a solution when the state length equals the number of elements
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Iterate over all choices
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Prune: do not reuse an element or choose the same value again at this depth
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Try: make a choice and update the state
			// Record the chosen value
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Proceed to the next choice
			backtrackII(state, choices, selected, res)
			// Backtrack: undo the choice and restore the previous state
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
