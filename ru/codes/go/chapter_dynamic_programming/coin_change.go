// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Размен монет: динамическое программирование */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Инициализация таблицы dp
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// Переход состояний: первая строка и первый столбец
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// Переход состояний: остальные строки и столбцы
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// Если целевая сумма превышена, монету i не выбирать
				dp[i][a] = dp[i-1][a]
			} else {
				// Меньшее из двух решений: не брать или взять монету i
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* Размен монет: динамическое программирование */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// Инициализация таблицы dp
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// Переход состояний
	for i := 1; i <= n; i++ {
		// Прямой обход
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// Если целевая сумма превышена, монету i не выбирать
				dp[a] = dp[a]
			} else {
				// Меньшее из двух решений: не брать или взять монету i
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
