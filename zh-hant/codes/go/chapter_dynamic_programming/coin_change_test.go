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

	// 動態規劃
	res := coinChangeDP(coins, amt)
	fmt.Printf("湊到目標金額所需的最少硬幣數量為 %d\n", res)

	// 空間最佳化後的動態規劃
	res = coinChangeDPComp(coins, amt)
	fmt.Printf("湊到目標金額所需的最少硬幣數量為 %d\n", res)
}
