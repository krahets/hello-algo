// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Алгоритм бэктрекинга: n ферзей */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// Когда все строки заполнены, записать решение
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// Обойти все столбцы
	for col := 0; col < n; col++ {
		// Вычислить главную и побочную диагонали, соответствующие этой клетке
		diag1 := row - col + n - 1
		diag2 := row + col
		// Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Попытка: разместить ферзя в этой клетке
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Перейти к размещению следующей строки
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Откат: восстановить эту клетку в пустое состояние
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Решить задачу n ферзей */
func nQueens(n int) [][][]string {
	// Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Записать, есть ли ферзь в столбце
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
