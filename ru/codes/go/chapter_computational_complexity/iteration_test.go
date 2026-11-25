// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* Основная программа */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nСумма в цикле for: res = ", res)

	res = whileLoop(n)
	fmt.Println("\nСумма в цикле while: res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nСумма в цикле while с двумя обновлениями: res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nРезультат обхода вложенными циклами for: ", resStr)
}
