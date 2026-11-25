// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// Greedy choices are guaranteed to give a global optimum here
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("The minimum number of coins needed to make %d is %d\n", amt, res)

	// Greedy choices do not guarantee a global optimum here
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("The minimum number of coins needed to make %d is %d\n", amt, res)
	fmt.Println("The actual minimum is 3 coins: 20 + 20 + 20")

	// Greedy choices do not guarantee a global optimum here
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("The minimum number of coins needed to make %d is %d\n", amt, res)
	fmt.Println("The actual minimum is 2 coins: 49 + 49")
}
