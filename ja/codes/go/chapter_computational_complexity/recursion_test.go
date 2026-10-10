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
	fmt.Println("\n再帰関数の合計結果 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n反復で再帰をシミュレートした合計結果 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n末尾再帰関数の合計結果 res = ", res)

	res = fib(n)
	fmt.Println("\nフィボナッチ数列の第", n, "項は", res)
}
