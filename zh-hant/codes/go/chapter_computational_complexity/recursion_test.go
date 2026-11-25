// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 主程式 */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\n遞迴函式的總和 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n以迭代模擬遞迴的總和 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n尾端遞迴函式的總和 res = ", res)

	res = fib(n)
	fmt.Println("\n費氏數列的第", n, "項為", res)
}
