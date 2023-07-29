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
	// 贪心算法
	res := maxProductCutting(n)
	fmt.Println("最大切分乘积为", res)
}
