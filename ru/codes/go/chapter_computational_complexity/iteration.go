// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* Цикл for */
func forLoop(n int) int {
	res := 0
	// В цикле вычислить сумму 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Цикл while */
func whileLoop(n int) int {
	res := 0
	// Инициализировать управляющую переменную
	i := 1
	// В цикле вычислить сумму 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// Обновить управляющую переменную
		i++
	}
	return res
}

/* Цикл while (с двумя обновлениями) */
func whileLoopII(n int) int {
	res := 0
	// Инициализировать управляющую переменную
	i := 1
	// В цикле вычислить сумму 1, 4, 10, ...
	for i <= n {
		res += i
		// Обновить управляющую переменную
		i++
		i *= 2
	}
	return res
}

/* Двойной цикл for */
func nestedForLoop(n int) string {
	res := ""
	// Цикл i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Цикл j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
