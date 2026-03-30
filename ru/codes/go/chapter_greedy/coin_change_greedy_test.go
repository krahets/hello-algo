// File: coin_change_greedy_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestCoinChangeGreedy(t *testing.T) {
	// Жадный подход: гарантирует нахождение глобально оптимального решения
	coins := []int{1, 5, 10, 20, 50, 100}
	amt := 186
	res := coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Минимальное число монет для набора суммы %d = %d\n", amt, res)

	// Жадный подход: не гарантирует нахождение глобально оптимального решения
	coins = []int{1, 20, 50}
	amt = 60
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Минимальное число монет для набора суммы %d = %d\n", amt, res)
	fmt.Println("На самом деле минимум равен 3: 20 + 20 + 20")

	// Жадный подход: не гарантирует нахождение глобально оптимального решения
	coins = []int{1, 49, 50}
	amt = 98
	res = coinChangeGreedy(coins, amt)
	fmt.Printf("coins = %v, amt = %d\n", coins, amt)
	fmt.Printf("Минимальное число монет для набора суммы %d = %d\n", amt, res)
	fmt.Println("На самом деле минимум равен 2: 49 + 49")
}
