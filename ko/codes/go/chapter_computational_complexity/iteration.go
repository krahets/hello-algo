// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for 반복문 */
func forLoop(n int) int {
	res := 0
	// 반복문으로 1, 2, ..., n-1, n의 합을 구한다
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while 반복문 */
func whileLoop(n int) int {
	res := 0
	// 조건 변수를 초기화한다
	i := 1
	// 반복문으로 1, 2, ..., n-1, n의 합을 구한다
	for i <= n {
		res += i
		// 조건 변수를 갱신한다
		i++
	}
	return res
}

/* while 반복문(두 번 갱신) */
func whileLoopII(n int) int {
	res := 0
	// 조건 변수를 초기화한다
	i := 1
	// 반복문으로 1, 4, 10, ...의 합을 구한다
	for i <= n {
		res += i
		// 조건 변수를 갱신한다
		i++
		i *= 2
	}
	return res
}

/* 이중 for 반복문 */
func nestedForLoop(n int) string {
	res := ""
	// i = 1, 2, ..., n-1, n을 반복한다
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// j = 1, 2, ..., n-1, n을 반복한다
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
