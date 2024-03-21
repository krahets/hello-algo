// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for 循环 */
func forLoop(n int) int {
	res := 0
	// 循环求和 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while 循环 */
func whileLoop(n int) int {
	res := 0
	// 初始化条件变量
	i := 1
	// 循环求和 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// 更新条件变量
		i++
	}
	return res
}

/* while 循环（两次更新） */
func whileLoopII(n int) int {
	res := 0
	// 初始化条件变量
	i := 1
	// 循环求和 1, 4, 10, ...
	for i <= n {
		res += i
		// 更新条件变量
		i++
		i *= 2
	}
	return res
}

/* 双层 for 循环 */
func nestedForLoop(n int) string {
	res := ""
	// 循环 i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// 循环 j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
