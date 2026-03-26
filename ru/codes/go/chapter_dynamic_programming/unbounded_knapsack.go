// File: unbounded_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* Неограниченный рюкзак: динамическое программирование */
func unboundedKnapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// Инициализировать таблицу dp
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// Переход состояния
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// Если вместимость рюкзака превышена, не брать предмет i
				dp[i][c] = dp[i-1][c]
			} else {
				// Выбрать большее из двух вариантов: не брать или взять предмет i
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* Неограниченный рюкзак: динамическое программирование с оптимизацией памяти */
func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// Инициализировать таблицу dp
	dp := make([]int, cap+1)
	// Переход состояния
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// Если вместимость рюкзака превышена, не брать предмет i
				dp[c] = dp[c]
			} else {
				// Выбрать большее из двух вариантов: не брать или взять предмет i
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
