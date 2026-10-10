// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Рюкзак 0-1: полный перебор */
func knapsackDFS(wgt, val []int, i, c int) int {
	// Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
	if i == 0 || c == 0 {
		return 0
	}
	// Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// Вернуть вариант с большей стоимостью из двух возможных
	return int(math.Max(float64(no), float64(yes)))
}

/* Рюкзак 0-1: поиск с мемоизацией */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
	if i == 0 || c == 0 {
		return 0
	}
	// Если запись уже есть, вернуть сразу
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// Вернуть вариант с большей стоимостью из двух возможных
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* Рюкзак 0-1: динамическое программирование */
func knapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// Инициализация таблицы dp
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// Переход состояний
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// Если вместимость рюкзака превышена, предмет i не выбирать
				dp[i][c] = dp[i-1][c]
			} else {
				// Большее из двух решений: не брать или взять предмет i
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Инициализация таблицы dp
	dp := make([]int, cap+1)
	// Переход состояний
	for i := 1; i <= n; i++ {
		// Обход в обратном порядке
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// Большее из двух решений: не брать или взять предмет i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
