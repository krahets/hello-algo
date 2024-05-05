// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nSum result of the for loop res =", res)

	res = whileLoop(n)
	fmt.Println("\nSum result of the while loop res =", res)

	res = whileLoopII(n)
	fmt.Println("\nSum result of the while loop (with two updates) res =", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nResult of the double for loop traversal =", resStr)
}
