// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Редакционное расстояние: полный перебор */
func editDistanceDFS(s string, t string, i int, j int) int {
	// Если s и t пусты, вернуть 0
	if i == 0 && j == 0 {
		return 0
	}
	// Если s пусто, вернуть длину t
	if i == 0 {
		return j
	}
	// Если t пусто, вернуть длину s
	if j == 0 {
		return i
	}
	// Если два символа равны, сразу пропустить их
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// Вернуть минимальное число шагов редактирования
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* Редакционное расстояние: поиск с мемоизацией */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// Если s и t пусты, вернуть 0
	if i == 0 && j == 0 {
		return 0
	}
	// Если s пусто, вернуть длину t
	if i == 0 {
		return j
	}
	// Если t пусто, вернуть длину s
	if j == 0 {
		return i
	}
	// Если запись уже есть, сразу вернуть ее
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// Если два символа равны, сразу пропустить их
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// Сохранить и вернуть минимальное число шагов редактирования
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* Редакционное расстояние: динамическое программирование */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// Переход состояний: первая строка и первый столбец
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// Переход состояний: остальные строки и столбцы
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// Если два символа равны, сразу пропустить их
				dp[i][j] = dp[i-1][j-1]
			} else {
				// Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// Переход состояний: первая строка
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// Переход состояний: остальные строки
	for i := 1; i <= n; i++ {
		// Переход состояний: первый столбец
		leftUp := dp[0] // Временно сохранить dp[i-1, j-1]
		dp[0] = i
		// Переход состояний: остальные столбцы
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// Если два символа равны, сразу пропустить их
				dp[j] = leftUp
			} else {
				// Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // Обновить до значения dp[i-1, j-1] для следующей итерации
		}
	}
	return dp[m]
}

func MinInt(a, b int) int {
	if a < b {
		return a
	}
	return b
}
