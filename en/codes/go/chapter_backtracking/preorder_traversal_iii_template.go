// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Check whether the current state is a solution */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* Record the solution */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* Check whether the choice is valid in the current state */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* Update the state */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* Restore the state */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* Backtracking: example 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// Check whether this is a solution
	if isSolution(state) {
		// Record the solution
		recordSolution(state, res)
	}
	// Iterate over all choices
	for _, choice := range *choices {
		// Prune: check whether the choice is valid
		if isValid(state, choice) {
			// Try: make a choice and update the state
			makeChoice(state, choice)
			// Proceed to the next choice
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// Backtrack: undo the choice and restore the previous state
			undoChoice(state, choice)
		}
	}
}
