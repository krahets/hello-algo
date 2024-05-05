// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Backtracking */
func backtrack(choices []int, state, n int, res []int) {
	// When climbing to the nth step, add 1 to the number of solutions
	if state == n {
		res[0] = res[0] + 1
	}
	// Traverse all choices
	for _, choice := range choices {
		// Pruning: do not allow climbing beyond the nth step
		if state+choice > n {
			continue
		}
		// Attempt: make a choice, update the state
		backtrack(choices, state+choice, n, res)
		// Retract
	}
}

/* Climbing stairs: Backtracking */
func climbingStairsBacktrack(n int) int {
	// Can choose to climb up 1 step or 2 steps
	choices := []int{1, 2}
	// Start climbing from the 0th step
	state := 0
	res := make([]int, 1)
	// Use res[0] to record the number of solutions
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
