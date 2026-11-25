// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Backtracking */
func backtrack(choices []int, state, n int, res []int) {
	// Count one more way when we reach stair n
	if state == n {
		res[0] = res[0] + 1
	}
	// Iterate over all choices
	for _, choice := range choices {
		// Prune moves that would overshoot stair n
		if state+choice > n {
			continue
		}
		// Try a choice and update the state
		backtrack(choices, state+choice, n, res)
		// Undo the choice
	}
}

/* Climbing stairs with backtracking */
func climbingStairsBacktrack(n int) int {
	// Each move can climb 1 or 2 stairs
	choices := []int{1, 2}
	// Start at stair 0
	state := 0
	res := make([]int, 1)
	// Store the number of ways in res[0]
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
