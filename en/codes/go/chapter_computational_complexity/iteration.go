// File: iteration.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "fmt"

/* for loop */
func forLoop(n int) int {
	res := 0
	// Sum 1, 2, ..., n-1, n in a loop
	for i := 1; i <= n; i++ {
		res += i
	}
	return res
}

/* while loop */
func whileLoop(n int) int {
	res := 0
	// Initialize the loop control variable
	i := 1
	// Sum 1, 2, ..., n-1, n in a loop
	for i <= n {
		res += i
		// Update the loop control variable
		i++
	}
	return res
}

/* while loop (two updates) */
func whileLoopII(n int) int {
	res := 0
	// Initialize the loop control variable
	i := 1
	// Sum 1, 4, 10, ... in a loop
	for i <= n {
		res += i
		// Update the loop control variable
		i++
		i *= 2
	}
	return res
}

/* Nested for loops */
func nestedForLoop(n int) string {
	res := ""
	// Loop over i = 1, 2, ..., n-1, n
	for i := 1; i <= n; i++ {
		for j := 1; j <= n; j++ {
			// Loop over j = 1, 2, ..., n-1, n
			res += fmt.Sprintf("(%d, %d), ", i, j)
		}
	}
	return res
}
