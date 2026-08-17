// File: complexity_exercises.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

/* 迭代求和 */
func sumIter(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* 遞迴求和 */
func sumRecur(n int) int {
	if n == 1 {
		return 1
	}
	return n + sumRecur(n-1)
}

/* 線性階迴圈 */
func linearLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		res += i
	}
	return res
}

/* 平方階迴圈 */
func quadraticLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		for j := i; j < n; j++ {
			res += j
		}
	}
	return res
}

/* 對數階迴圈 */
func logarithmicLoop(n int) int {
	for n > 1 {
		n /= 2
	}
	return n
}
