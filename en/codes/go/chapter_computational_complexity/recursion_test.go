// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Driver code */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\nSum from recursion: res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\nSum from simulating recursion with iteration: res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\nSum from tail recursion: res = ", res)

	res = fib(n)
	fmt.Println("\nFibonacci term", n, "is", res)
}
