// File: complexity_exercises.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

/* Sum using iteration */
func sumIter(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* Sum using recursion */
func sumRecur(n int) int {
	if n == 1 {
		return 1
	}
	return n + sumRecur(n-1)
}

/* Linear-time loop */
func linearLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		res += i
	}
	return res
}

/* Quadratic-time loop */
func quadraticLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		for j := i; j < n; j++ {
			res += j
		}
	}
	return res
}

/* Logarithmic-time loop */
func logarithmicLoop(n int) int {
	for n > 1 {
		n /= 2
	}
	return n
}
