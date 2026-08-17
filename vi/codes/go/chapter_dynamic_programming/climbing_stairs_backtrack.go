// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Backtracking */
func backtrack(choices []int, state, n int, res []int) {
	// When climbing to the n-th stair, add 1 to the solution count
	if state == n {
		res[0] = res[0] + 1
	}
	// Traverse all choices
	for _, choice := range choices {
		// Pruning: not allowed to go beyond the n-th stair
		if state+choice > n {
			continue
		}
		// Attempt: make choice, update state
		backtrack(choices, state+choice, n, res)
		// Backtrack
	}
}

/* Climbing stairs: Backtracking */
func climbingStairsBacktrack(n int) int {
	// Can choose to climb up 1 or 2 stairs
	choices := []int{1, 2}
	// Start climbing from the 0-th stair
	state := 0
	res := make([]int, 1)
	// Use res[0] to record the solution count
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
