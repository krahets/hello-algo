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

	// Динамическое программирование
	res := coinChangeDP(coins, amt)
	fmt.Printf("Минимальное число монет для набора целевой суммы = %d\n", res)

	// Динамическое программирование с оптимизацией памяти
	res = coinChangeDPComp(coins, amt)
	fmt.Printf("Минимальное число монет для набора целевой суммы = %d\n", res)
}
