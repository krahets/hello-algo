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
	fmt.Println("\nfor loop sum: res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile loop sum: res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile loop sum (two updates): res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nNested for loop traversal: ", resStr)
}
