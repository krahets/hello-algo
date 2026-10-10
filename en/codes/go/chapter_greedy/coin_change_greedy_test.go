// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// Greedy algorithm: Can guarantee finding the global optimal solution
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Minimum number of coins needed to make %d is %d\n", amt, res)

	// Greedy algorithm: Cannot guarantee finding the global optimal solution
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Minimum number of coins needed to make %d is %d\n", amt, res)
	fmt.Println("Actually the minimum number needed is 3, i.e., 20 + 20 + 20")

	// Greedy algorithm: Cannot guarantee finding the global optimal solution
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Minimum number of coins needed to make %d is %d\n", amt, res)
	fmt.Println("Actually the minimum number needed is 2, i.e., 49 + 49")
}
