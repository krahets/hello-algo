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
	fmt.Println("\nРезультат суммирования рекурсивной функции res =", res)

	res = forLoopRecur(n)
	fmt.Println("\nИмитировать рекурсию с помощью итерациирезультат суммирования res =", res)

	res = tailRecur(n, 0)
	fmt.Println("\nРезультат суммирования хвостовой рекурсией res =", res)

	res = fib(n)
	fmt.Println("\n", n, "-й элемент последовательности Фибоначчи равен", res)
}
