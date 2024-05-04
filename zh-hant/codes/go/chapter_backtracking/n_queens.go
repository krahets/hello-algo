// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：n 皇后 */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// 當放置完所有行時，記錄解
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// 走訪所有列
	for col := 0; col < n; col++ {
		// 計算該格子對應的主對角線和次對角線
		diag1 := row - col + n - 1
		diag2 := row + col
		// 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// 嘗試：將皇后放置在該格子
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// 放置下一行
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// 回退：將該格子恢復為空位
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* 求解 n 皇后 */
func nQueens(n int) [][][]string {
	// 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// 記錄列是否有皇后
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
