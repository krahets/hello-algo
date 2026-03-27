// File: coin_change_ii.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Размен монет II: динамическое программирование */
func coinChangeIIDP(coins []int, amt int) int {
	n := len(coins)
	// Инициализация таблицы dp
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// Инициализация первого столбца
	for i := 0; i <= n; i++ {
		dp[i][0] = 1
	}
	// Переход состояний: остальные строки и столбцы
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// Если целевая сумма превышена, монету i не выбирать
				dp[i][a] = dp[i-1][a]
			} else {
				// Сумма двух решений: не брать или взять монету i
				dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
			}
		}
	}
	return dp[n][amt]
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
func coinChangeIIDPComp(coins []int, amt int) int {
	n := len(coins)
	// Инициализация таблицы dp
	dp := make([]int, amt+1)
	dp[0] = 1
	// Переход состояний
	for i := 1; i <= n; i++ {
		// Прямой обход
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// Если целевая сумма превышена, монету i не выбирать
				dp[a] = dp[a]
			} else {
				// Сумма двух решений: не брать или взять монету i
				dp[a] = dp[a] + dp[a-coins[i-1]]
			}
		}
	}
	return dp[amt]
}
