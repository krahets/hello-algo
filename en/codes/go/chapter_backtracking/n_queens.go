// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking algorithm: N queens */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// When all rows are placed, record the solution
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// Traverse all columns
	for col := 0; col < n; col++ {
		// Calculate the main diagonal and anti-diagonal corresponding to this cell
		diag1 := row - col + n - 1
		diag2 := row + col
		// Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Attempt: place the queen in this cell
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Place the next row
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Backtrack: restore this cell to an empty cell
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Solve N queens */
func nQueens(n int) [][][]string {
	// Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Record whether there is a queen in the column
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
