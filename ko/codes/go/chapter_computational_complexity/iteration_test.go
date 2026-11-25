// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 실행 예제 */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nfor 문의 합 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile 문의 합 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile 문(두 번 갱신)의 합 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n이중 for 문의 순회 결과: ", resStr)
}
