// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 回溯演算法：n 皇后 */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// 每一列都放好皇后後，記錄此解
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// 逐一檢查各欄
	for col := 0; col < n; col++ {
		// 計算這一格對應的主對角線與副對角線索引
		diag1 := row - col + n - 1
		diag2 := row + col
		// 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// 嘗試：將皇后放在這一格
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// 在下一列放置皇后
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// 回溯：將這一格還原為空位
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* 求解 n 皇后問題 */
func nQueens(n int) [][][]string {
	// 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// 記錄各欄是否已有皇后
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
