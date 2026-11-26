// File: n_queens.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Поиск с возвратом: задача о n ферзях */
func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
	// Когда ферзи расставлены во всех строках, сохраняем решение
	if row == n {
		newState := make([][]string, len(*state))
		for i, _ := range newState {
			newState[i] = make([]string, len((*state)[0]))
			copy(newState[i], (*state)[i])

		}
		*res = append(*res, newState)
		return
	}
	// Перебираем все столбцы
	for col := 0; col < n; col++ {
		// Вычисляем индексы прямой и обратной диагоналей клетки
		diag1 := row - col + n - 1
		diag2 := row + col
		// Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
		if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
			// Пробуем поставить ферзя на эту клетку
			(*state)[row][col] = "Q"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
			// Переходим к следующей строке
			backtrack(row+1, n, state, res, cols, diags1, diags2)
			// Возврат: освобождаем клетку
			(*state)[row][col] = "#"
			(*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
		}
	}
}

/* Решение задачи о n ферзях */
func nQueens(n int) [][][]string {
	// Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
	state := make([][]string, n)
	for i := 0; i < n; i++ {
		row := make([]string, n)
		for i := 0; i < n; i++ {
			row[i] = "#"
		}
		state[i] = row
	}
	// Отмечаем столбцы, занятые ферзями
	cols := make([]bool, n)
	diags1 := make([]bool, 2*n-1)
	diags2 := make([]bool, 2*n-1)
	res := make([][][]string, 0)
	backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
	return res
}
