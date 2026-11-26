// File: min_path_sum.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Минимальная сумма на пути: полный перебор */
func minPathSumDFS(grid [][]int, i, j int) int {
	// При достижении верхней левой ячейки завершить поиск
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
	up := minPathSumDFS(grid, i-1, j)
	left := minPathSumDFS(grid, i, j-1)
	// Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
	return int(math.Min(float64(left), float64(up))) + grid[i][j]
}

/* Минимальная сумма на пути: поиск с мемоизацией */
func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
	// При достижении верхней левой ячейки завершить поиск
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// Если результат сохранён, сразу вернуть его
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// Минимальные стоимости путей до ячеек слева и сверху
	up := minPathSumDFSMem(grid, mem, i-1, j)
	left := minPathSumDFSMem(grid, mem, i, j-1)
	// Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
	mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
	return mem[i][j]
}

/* Минимальная сумма на пути: динамическое программирование */
func minPathSumDP(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// Инициализировать таблицу dp
	dp := make([][]int, n)
	for i := 0; i < n; i++ {
		dp[i] = make([]int, m)
	}
	dp[0][0] = grid[0][0]
	// Переход: первая строка
	for j := 1; j < m; j++ {
		dp[0][j] = dp[0][j-1] + grid[0][j]
	}
	// Переход: первый столбец
	for i := 1; i < n; i++ {
		dp[i][0] = dp[i-1][0] + grid[i][0]
	}
	// Переход: остальные строки и столбцы
	for i := 1; i < n; i++ {
		for j := 1; j < m; j++ {
			dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
		}
	}
	return dp[n-1][m-1]
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
func minPathSumDPComp(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// Инициализировать таблицу dp
	dp := make([]int, m)
	// Переход: первая строка
	dp[0] = grid[0][0]
	for j := 1; j < m; j++ {
		dp[j] = dp[j-1] + grid[0][j]
	}
	// Переход: остальные строки и столбцы
	for i := 1; i < n; i++ {
		// Переход: первый столбец
		dp[0] = dp[0] + grid[i][0]
		// Переход: остальные столбцы
		for j := 1; j < m; j++ {
			dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
		}
	}
	return dp[m-1]
}
