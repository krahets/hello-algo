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
	fmt.Println("\nRecursive sum: res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\nSum using simulated recursion: res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\nTail-recursive sum: res = ", res)

	res = fib(n)
	fmt.Println("\nFibonacci term", n, "is", res)
}
