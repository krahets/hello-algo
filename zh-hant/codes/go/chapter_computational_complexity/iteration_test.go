// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 主程式 */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nfor 迴圈的總和 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile 迴圈的總和 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile 迴圈（更新兩次）的總和 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n雙層 for 迴圈走訪的結果 ", resStr)
}
