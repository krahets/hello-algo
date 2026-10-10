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
	fmt.Println("\nРезультат суммирования в цикле for res = ", res)

	res = whileLoop(n)
	fmt.Println("\nРезультат суммирования в цикле while res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nРезультат суммирования в цикле while (двойное обновление) res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\nРезультат обхода в двойном цикле for ", resStr)
}
