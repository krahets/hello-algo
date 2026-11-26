// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* Цикл for */
func forLoop(n int) int {
	res := 0
	// Сложить числа 1, 2, ..., n-1, n в цикле
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Цикл while */
func whileLoop(n int) int {
	res := 0
	// Задать начальное значение переменной условия
	i := 1
	// Сложить числа 1, 2, ..., n-1, n в цикле
	for i <= n {
		res += i
		// Обновить переменную условия
		i++
	}
	return res
}

/* Цикл while с двумя обновлениями */
func whileLoopII(n int) int {
	res := 0
	// Задать начальное значение переменной условия
	i := 1
	// Сложить числа 1, 4, 10, ... в цикле
	for i <= n {
		res += i
		// Обновить переменную условия
		i++
		i *= 2
	}
	return res
}

/* Вложенные циклы for */
func nestedForLoop(n int) string {
	res := ""
	// Перебрать i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Перебрать j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
