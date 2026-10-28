// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 실행 코드 */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nfor 반복문으로 구한 합 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile 반복문으로 구한 합 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile 반복문(두 번 갱신)으로 구한 합 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n이중 for 반복문의 순회 결과 ", resStr)
}
