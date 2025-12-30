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
	fmt.Println("\nfor loop sum result res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile loop sum result res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile loop (two updates) sum result res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nDouble for loop traversal result ", resStr)
}
