// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 貪欲法：大域的最適解が得られることを保証できる
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res)

	// 貪欲法：大域的最適解が得られることを保証できない
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res)
	fmt.Println("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20")

	// 貪欲法：大域的最適解が得られることを保証できない
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res)
	fmt.Println("実際に必要な最小枚数は 2 、すなわち 49 + 49")
}
