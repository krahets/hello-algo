// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 実行用コード */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\n再帰関数で求めた和 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n反復で再帰を再現して求めた和 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n末尾再帰関数で求めた和 res = ", res)

	res = fib(n)
	fmt.Println("\nフィボナッチ数列の第", n, "項は", res)
}
