// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 貪欲法：大域最適解を保証できる
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d を作るのに必要な最小硬貨枚数は %d\n", amt, res)

	// 貪欲法：大域最適解を保証できない
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d を作るのに必要な最小硬貨枚数は %d\n", amt, res)
	fmt.Println("実際に必要な最小枚数は 3、つまり 20 + 20 + 20")

	// 貪欲法：大域最適解を保証できない
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d を作るのに必要な最小硬貨枚数は %d\n", amt, res)
	fmt.Println("実際に必要な最小枚数は 2、つまり 49 + 49")
}
