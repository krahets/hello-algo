// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for loop */
func forLoop(n int) int {
	res := 0
	// Sum 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while loop */
func whileLoop(n int) int {
	res := 0
	// Initialize condition variable
	i := 1
	// Sum 1, 2, ..., n-1, n
	for i <= n {
		res += i
		// Update condition variable
		i++
	}
	return res
}

/* while loop (two updates) */
func whileLoopII(n int) int {
	res := 0
	// Initialize condition variable
	i := 1
	// Sum 1, 4, 10, ...
	for i <= n {
		res += i
		// Update condition variable
		i++
		i *= 2
	}
	return res
}

/* Nested for loop */
func nestedForLoop(n int) string {
	res := ""
	// Loop i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Loop j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
