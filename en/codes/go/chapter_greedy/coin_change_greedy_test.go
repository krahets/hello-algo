// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// Greedy: can ensure finding a global optimal solution
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("To collect %d, the minimum number of coins required is %d\n", amt, res)

	// Greedy: cannot ensure finding a global optimal solution
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("To collect %d, the minimum number of coins required is %d\n", amt, res)
	fmt.Println("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20")

	// Greedy: cannot ensure finding a global optimal solution
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("To collect %d, the minimum number of coins required is %d\n", amt, res)
	fmt.Println("In reality, the minimum number needed is 2, i.e., 49 + 49")
}
