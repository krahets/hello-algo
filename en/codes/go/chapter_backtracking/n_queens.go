// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking: n-queens */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// Record a solution when a queen has been placed in every row
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// Iterate over all columns
	for col := 0; col < n; col++ {
		// Calculate the main-diagonal and anti-diagonal indices for this square
		diag1 := row - col + n - 1
		diag2 := row + col
		// Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Try: place a queen on this square
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Place a queen in the next row
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Backtrack: restore this square to empty
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Solve the n-queens problem */
func nQueens(n int) [][][]string {
	// Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Track whether a column contains a queen
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
