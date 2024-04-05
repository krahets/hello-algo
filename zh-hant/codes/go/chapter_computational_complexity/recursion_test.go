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
	fmt.Println("\n遞迴函式的求和結果 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n使用迭代模擬遞迴求和結果 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n尾遞迴函式的求和結果 res = ", res)

	res = fib(n)
	fmt.Println("\n費波那契數列的第", n, "項為", res)
}
