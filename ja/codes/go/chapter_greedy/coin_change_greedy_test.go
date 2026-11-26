// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 貪欲法で大域的最適解が必ず求まる例
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res)

	// 貪欲法では大域的最適解を保証できない例
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res)
	fmt.Println("実際の最少枚数は 3 枚（20 + 20 + 20）")

	// 貪欲法では大域的最適解を保証できない例
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res)
	fmt.Println("実際の最少枚数は 2 枚（49 + 49）")
}
