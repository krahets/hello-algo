// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for 迴圈 */
func forLoop(n int) int {
	res := 0
	// 迴圈求和 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while 迴圈 */
func whileLoop(n int) int {
	res := 0
	// 初始化條件變數
	i := 1
	// 迴圈求和 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// 更新條件變數
		i++
	}
	return res
}

/* while 迴圈（兩次更新） */
func whileLoopII(n int) int {
	res := 0
	// 初始化條件變數
	i := 1
	// 迴圈求和 1, 4, 10, ...
	for i <= n {
		res += i
		// 更新條件變數
		i++
		i *= 2
	}
	return res
}

/* 雙層 for 迴圈 */
func nestedForLoop(n int) string {
	res := ""
	// 迴圈 i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// 迴圈 j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
