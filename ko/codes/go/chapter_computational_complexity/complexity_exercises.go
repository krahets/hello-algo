// File: complexity_exercises.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

/* 반복으로 합 구하기 */
func sumIter(n int) int {
	res := 0
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* 재귀로 합 구하기 */
func sumRecur(n int) int {
	if n == 1 {
		return 1
	}
	return n + sumRecur(n-1)
}

/* 선형 차수 반복문 */
func linearLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		res += i
	}
	return res
}

/* 제곱 차수 반복문 */
func quadraticLoop(n int) int {
	res := 0
	for i := 0; i < n; i++ {
		for j := i; j < n; j++ {
			res += j
		}
	}
	return res
}

/* 로그 차수 반복문 */
func logarithmicLoop(n int) int {
	for n > 1 {
		n /= 2
	}
	return n
}
