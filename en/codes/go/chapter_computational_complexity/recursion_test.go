// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\nSum result of the recursive function res =", res)

	res = forLoopRecur(n)
	fmt.Println("\nSum result using iteration to simulate recursion res =", res)

	res = tailRecur(n, 0)
	fmt.Println("\nSum result of the tail-recursive function res =", res)

	res = fib(n)
	fmt.Println("\nThe Fibonacci sequence at the nth position ", n, " is", res)
}
