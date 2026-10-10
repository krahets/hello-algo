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

	// 全探索
	res := knapsackDFS(wgt, val, n, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)

	// メモ化探索
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, c+1)
		for j := 0; j <= c; j++ {
			mem[i][j] = -1
		}
	}
	res = knapsackDFSMem(wgt, val, mem, n, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)

	// 動的計画法
	res = knapsackDP(wgt, val, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)

	// 空間最適化後の動的計画法
	res = knapsackDPComp(wgt, val, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)
}

func TestUnboundedKnapsack(t *testing.T) {
	wgt := []int{1, 2, 3}
	val := []int{5, 11, 15}
	c := 4

	// 動的計画法
	res := unboundedKnapsackDP(wgt, val, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)

	// 空間最適化後の動的計画法
	res = unboundedKnapsackDPComp(wgt, val, c)
	fmt.Printf("ナップサック容量を超えない最大価値は %d\n", res)
}
