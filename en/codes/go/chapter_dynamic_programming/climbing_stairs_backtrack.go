// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Backtracking */
func backtrack(choices []int, state, n int, res []int) {
	// When step n is reached, increase the number of ways by 1
	if state == n {
		res[0] = res[0] + 1
	}
	// Iterate over all choices
	for _, choice := range choices {
		// Prune: do not go beyond step n
		if state+choice > n {
			continue
		}
		// Try: make a choice and update the state
		backtrack(choices, state+choice, n, res)
		// Backtrack
	}
}

/* Climbing stairs: backtracking */
func climbingStairsBacktrack(n int) int {
	// Choose to climb 1 or 2 steps
	choices := []int{1, 2}
	// Start climbing from step 0
	state := 0
	res := make([]int, 1)
	// Use res[0] to record the number of ways
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
