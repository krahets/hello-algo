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
	fmt.Println("\nРезультат суммирования в рекурсивной функции res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\nРезультат суммирования при имитации рекурсии итерацией res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\nРезультат суммирования в хвостовой рекурсии res = ", res)

	res = fib(n)
	fmt.Println("\nЧлен последовательности Фибоначчи с номером", n, "=", res)
}
