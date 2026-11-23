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

	// 동적 계획법
	res := coinChangeDP(coins, amt)
	fmt.Printf("목표 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", res)

	// 공간을 최적화한 동적 계획법
	res = coinChangeDPComp(coins, amt)
	fmt.Printf("목표 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", res)
}
