// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 실행 코드 */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\n재귀 함수로 구한 합 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n반복으로 재귀를 구현하여 구한 합 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n꼬리 재귀 함수로 구한 합 res = ", res)

	res = fib(n)
	fmt.Println("\n피보나치 수열의 항 번호:", n, "; 해당 항의 값:", res)
}
