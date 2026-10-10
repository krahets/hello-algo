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
	fmt.Println("\nfor ループの合計結果 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile ループの合計結果 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile ループ（2 回更新）の合計結果 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n二重 for ループの走査結果 ", resStr)
}
