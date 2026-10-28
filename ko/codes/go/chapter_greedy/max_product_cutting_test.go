// File: max_product_cutting_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestMaxProductCutting(t *testing.T) {
	n := 58
	// 탐욕 알고리즘
	res := maxProductCutting(n)
	fmt.Println("분할 후의 최대 곱:", res)
}
