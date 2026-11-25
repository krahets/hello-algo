// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 貪婪法：保證能找到全域最佳解
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊出 %d 所需的最少硬幣數為 %d\n", amt, res)

	// 貪婪法：無法保證找到全域最佳解
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊出 %d 所需的最少硬幣數為 %d\n", amt, res)
	fmt.Println("實際上最少只需 3 枚，即 20 + 20 + 20")

	// 貪婪法：無法保證找到全域最佳解
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊出 %d 所需的最少硬幣數為 %d\n", amt, res)
	fmt.Println("實際上最少只需 2 枚，即 49 + 49")
}
