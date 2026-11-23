// File: coin_change_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import (
	"fmt"
	"testing"
)

func TestCoinChange(t *testing.T) {
	coins := []int{1, 2, 5}
	amt := 4

	// 動的計画法
	res := coinChangeDP(coins, amt)
	fmt.Printf("目標金額にするために必要な硬貨の最小枚数は %d\n", res)

	// 空間を最適化した動的計画法
	res = coinChangeDPComp(coins, amt)
	fmt.Printf("目標金額にするために必要な硬貨の最小枚数は %d\n", res)
}
