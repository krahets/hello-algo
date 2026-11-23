// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 백트래킹 알고리즘: n-퀸 */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// 모든 행에 배치했으면 해를 기록한다
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// 모든 열을 순회한다
	for col := 0; col < n; col++ {
		// 해당 칸이 속한 주대각선과 부대각선을 계산한다
		diag1 := row - col + n - 1
		diag2 := row + col
		// 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// 시도: 해당 칸에 퀸을 놓는다
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// 다음 행에 배치한다
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// 되돌리기: 해당 칸을 빈칸으로 되돌린다
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* n-퀸 문제 풀기 */
func nQueens(n int) [][][]string {
	// n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// 열에 퀸이 있는지 기록한다
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
