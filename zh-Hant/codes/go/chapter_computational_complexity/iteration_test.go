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
	fmt.Println("\nfor 循环的求和结果 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile 循环的求和结果 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile 循环（两次更新）求和结果 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n双层 for 循环的遍历结果 ", resStr)
}
