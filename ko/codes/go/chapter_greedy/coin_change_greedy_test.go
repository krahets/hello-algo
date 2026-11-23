// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 탐욕: 전역 최적해를 찾는 것이 보장된다
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res)

	// 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res)
	fmt.Println("실제로 필요한 최소 개수는 3개이며, 20 + 20 + 20이다")

	// 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("%d의 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", amt, res)
	fmt.Println("실제로 필요한 최소 개수는 2개이며, 49 + 49이다")
}
