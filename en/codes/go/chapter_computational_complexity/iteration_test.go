// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Driver code */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nSum from the for loop: res = ", res)

	res = whileLoop(n)
	fmt.Println("\nSum from the while loop: res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nSum from the while loop (two updates): res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nTraversal result from the nested for loops: ", resStr)
}
