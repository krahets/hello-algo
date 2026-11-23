// File: fractional_knapsack_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestFractionalKnapsack(t *testing.T) {
	wgt := []int{10, 20, 30, 40, 50}
	val := []int{50, 120, 150, 210, 240}
	capacity := 50

	// 貪欲アルゴリズム
	res := fractionalKnapsack(wgt, val, capacity)
	fmt.Println("ナップサックの容量を超えない品物の最大価値は", res)
}
