// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Для суммы %d минимальное число монет: %d\n", amt, res)

	// Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Для суммы %d минимальное число монет: %d\n", amt, res)
	fmt.Println("На самом деле минимум — 3 монеты: 20 + 20 + 20")

	// Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Для суммы %d минимальное число монет: %d\n", amt, res)
	fmt.Println("На самом деле минимум — 2 монеты: 49 + 49")
}
