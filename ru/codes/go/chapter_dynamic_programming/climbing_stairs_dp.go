// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Подъем по лестнице: динамическое программирование */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// Инициализация таблицы dp для хранения решений подзадач
	dp := make([]int, n+1)
	// Начальное состояние: заранее задать решения наименьших подзадач
	dp[1] = 1
	dp[2] = 2
	// Переход состояний: постепенное решение больших подзадач через меньшие
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// Переход состояний: постепенное решение больших подзадач через меньшие
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
