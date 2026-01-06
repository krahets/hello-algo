// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking algorithm: Permutations II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// When the state length equals the number of elements, record the solution
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Traverse all choices
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Attempt: make choice, update state
			// Record the selected element value
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Proceed to the next round of selection
			backtrackII(state, choices, selected, res)
			// Backtrack: undo choice, restore to previous state
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
