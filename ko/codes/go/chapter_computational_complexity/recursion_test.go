// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 실행 예제 */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\n재귀 함수로 구한 합 res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\n반복으로 재귀를 구현해 구한 합 res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\n꼬리 재귀 함수로 구한 합 res = ", res)

	res = fib(n)
	fmt.Println("\n피보나치 수열의", n, "번째 항 =", res)
}
