// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 贪心：能够保证找到全局最优解
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res)

	// 贪心：无法保证找到全局最优解
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res)
	fmt.Println("实际上需要的最少数量为 3 ，即 20 + 20 + 20")

	// 贪心：无法保证找到全局最优解
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res)
	fmt.Println("实际上需要的最少数量为 2 ，即 49 + 49")
}
