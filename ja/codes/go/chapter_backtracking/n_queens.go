// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* バックトラッキング：N クイーン */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// すべての行への配置が完了したら、解を記録する
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// すべての列を走査
	for col := 0; col < n; col++ {
		// このマスに対応する主対角線と副対角線を計算
		diag1 := row - col + n - 1
		diag2 := row + col
		// 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// 試行：そのマスにクイーンを置く
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// 次の行に配置する
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// 戻す：そのマスを空きマスに戻す
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* N クイーンを解く */
func nQueens(n int) [][][]string {
	// n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// 列にクイーンがあるか記録
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
