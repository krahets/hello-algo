// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Determine if the current state is a solution */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* Record solution */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* Determine if the choice is legal under the current state */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* Update state */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* Restore state */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* Backtracking algorithm: Example three */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// Check if it's a solution
	if isSolution(state) {
		// Record solution
		recordSolution(state, res)
	}
	// Traverse all choices
	for _, choice := range *choices {
		// Pruning: check if the choice is legal
		if isValid(state, choice) {
			// Attempt: make a choice, update the state
			makeChoice(state, choice)
			// Proceed to the next round of selection
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// Retract: undo the choice, restore to the previous state
			undoChoice(state, choice)
		}
	}
}
