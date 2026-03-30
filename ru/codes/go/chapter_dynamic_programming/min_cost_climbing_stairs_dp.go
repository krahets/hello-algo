// File: min_cost_climbing_stairs_dp.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
func minCostClimbingStairsDP(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// Инициализация таблицы dp для хранения решений подзадач
	dp := make([]int, n+1)
	// Начальное состояние: заранее задать решения наименьших подзадач
	dp[1] = cost[1]
	dp[2] = cost[2]
	// Переход состояний: постепенное решение больших подзадач через меньшие
	for i := 3; i <= n; i++ {
		dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
	}
	return dp[n]
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
func minCostClimbingStairsDPComp(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// Начальное состояние: заранее задать решения наименьших подзадач
	a, b := cost[1], cost[2]
	// Переход состояний: постепенное решение больших подзадач через меньшие
	for i := 3; i <= n; i++ {
		tmp := b
		b = min(a, tmp) + cost[i]
		a = tmp
	}
	return b
}
