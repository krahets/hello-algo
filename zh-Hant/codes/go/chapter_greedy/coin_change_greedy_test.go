// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 貪婪：能夠保證找到全域性最優解
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res)

	// 貪婪：無法保證找到全域性最優解
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res)
	fmt.Println("實際上需要的最少數量為 3 ，即 20 + 20 + 20")

	// 貪婪：無法保證找到全域性最優解
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res)
	fmt.Println("實際上需要的最少數量為 2 ，即 49 + 49")
}
