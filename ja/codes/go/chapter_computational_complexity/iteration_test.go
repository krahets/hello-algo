// File: iteration_test.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

/* 実行例 */
func TestIteration(t *testing.T) {
	n := 5
	res := forLoop(n)
	fmt.Println("\nfor ループによる総和 res = ", res)

	res = whileLoop(n)
	fmt.Println("\nwhile ループによる総和 res = ", res)

	res = whileLoopII(n)
	fmt.Println("\nwhile ループ（2 回更新）による総和 res = ", res)

	resStr := nestedForLoop(n)
	fmt.Println("\n二重の for ループの走査結果 ", resStr)
}
