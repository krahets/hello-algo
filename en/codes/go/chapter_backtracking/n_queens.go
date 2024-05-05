// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Backtracking algorithm: n queens */
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
		// Calculate the main and minor diagonals corresponding to the cell
		diag1 := row - col + n - 1
		diag2 := row + col
		// Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Attempt: place the queen in the cell
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Place the next row
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Retract: restore the cell to an empty spot
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Solve n queens */
func nQueens(n int) [][][]string {
	// Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Record columns with queens
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
