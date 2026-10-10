// File: knapsack_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import (
	"fmt"
	"testing"
)

func TestKnapsack(t *testing.T) {
	wgt := []int{10, 20, 30, 40, 50}
	val := []int{50, 120, 150, 210, 240}
	c := 50
	n := len(wgt)

	// Полный перебор
	res := knapsackDFS(wgt, val, n, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)

	// Поиск с мемоизацией
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, c+1)
		for j := 0; j <= c; j++ {
			mem[i][j] = -1
		}
	}
	res = knapsackDFSMem(wgt, val, mem, n, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)

	// Динамическое программирование
	res = knapsackDP(wgt, val, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)

	// Динамическое программирование с оптимизацией памяти
	res = knapsackDPComp(wgt, val, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)
}

func TestUnboundedKnapsack(t *testing.T) {
	wgt := []int{1, 2, 3}
	val := []int{5, 11, 15}
	c := 4

	// Динамическое программирование
	res := unboundedKnapsackDP(wgt, val, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)

	// Динамическое программирование с оптимизацией памяти
	res = unboundedKnapsackDPComp(wgt, val, c)
	fmt.Printf("Максимальная стоимость предметов без превышения вместимости рюкзака = %d\n", res)
}
