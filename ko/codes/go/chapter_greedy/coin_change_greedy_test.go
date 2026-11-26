// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// 탐욕 선택이 전역 최적해를 보장하는 경우
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("금액 %d에 필요한 최소 동전 수: %d\n", amt, res)

	// 탐욕 선택이 전역 최적해를 보장하지 않는 경우
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("금액 %d에 필요한 최소 동전 수: %d\n", amt, res)
	fmt.Println("실제로는 20 + 20 + 20으로 최소 3개가 필요하다")

	// 탐욕 선택이 전역 최적해를 보장하지 않는 경우
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("금액 %d에 필요한 최소 동전 수: %d\n", amt, res)
	fmt.Println("실제로는 49 + 49로 최소 2개가 필요하다")
}
