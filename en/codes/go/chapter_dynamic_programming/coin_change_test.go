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

	// Dynamic programming
	res := coinChangeDP(coins, amt)
	fmt.Printf("Minimum number of coins needed to make target amount is %d\n", res)

	// Space-optimized dynamic programming
	res = coinChangeDPComp(coins, amt)
	fmt.Printf("Minimum number of coins needed to make target amount is %d\n", res)
}
