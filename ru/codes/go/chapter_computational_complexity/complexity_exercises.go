// File: complexity_exercises.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

/* Итеративное суммирование */
func sumIter(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Рекурсивное суммирование */
func sumRecur(n int) int {
	if n == 1 {
		return 1
	}
	return n + sumRecur(n-1)
}

/* Цикл линейной сложности */
func linearLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		res += i
	}
	return res
}

/* Цикл квадратичной сложности */
func quadraticLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		for j := i; j < n; j++ {
			res += j
		}
	}
	return res
}

/* Цикл логарифмической сложности */
func logarithmicLoop(n int) int {
	for n > 1 {
		n /= 2
	}
	return n
}
