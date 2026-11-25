// File: recursion_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Основная программа */
func TestRecursion(t *testing.T) {
	n := 5
	res := recur(n)
	fmt.Println("\nСумма при рекурсии: res = ", res)

	res = forLoopRecur(n)
	fmt.Println("\nСумма при итеративном моделировании рекурсии: res = ", res)

	res = tailRecur(n, 0)
	fmt.Println("\nСумма при хвостовой рекурсии: res = ", res)

	res = fib(n)
	fmt.Println("\nЧисло Фибоначчи с номером", n, "равно", res)
}
