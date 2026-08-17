// File: fast_power.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_divide_and_conquer

/* Быстрое возведение в степень */
func fastPow(x, n int) int {
	if n == 0 {
		return 1
	}
	half := fastPow(x, n/2)
	if n%2 == 0 {
		return half * half
	}
	return half * half * x
}
