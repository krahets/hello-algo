// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* Цикл for */
func forLoop(n int) int {
	res := 0
	// Циклическое суммирование 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Цикл while */
func whileLoop(n int) int {
	res := 0
	// Инициализация условной переменной
	i := 1
	// Циклическое суммирование 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// Обновить условную переменную
		i++
	}
	return res
}

/* Цикл while (двойное обновление) */
func whileLoopII(n int) int {
	res := 0
	// Инициализация условной переменной
	i := 1
	// Циклическое суммирование 1, 4, 10, ...
	for i <= n {
		res += i
		// Обновить условную переменную
		i++
		i *= 2
	}
	return res
}

/* Двойной цикл for */
func nestedForLoop(n int) string {
	res := ""
	// Цикл по i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Цикл по j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
