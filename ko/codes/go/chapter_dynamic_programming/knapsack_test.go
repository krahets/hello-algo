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

	// 완전 탐색
	res := knapsackDFS(wgt, val, n, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)

	// 메모이제이션을 이용한 탐색
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, c+1)
		for j := 0; j <= c; j++ {
			mem[i][j] = -1
		}
	}
	res = knapsackDFSMem(wgt, val, mem, n, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)

	// 동적 계획법
	res = knapsackDP(wgt, val, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)

	// 공간을 최적화한 동적 계획법
	res = knapsackDPComp(wgt, val, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)
}

func TestUnboundedKnapsack(t *testing.T) {
	wgt := []int{1, 2, 3}
	val := []int{5, 11, 15}
	c := 4

	// 동적 계획법
	res := unboundedKnapsackDP(wgt, val, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)

	// 공간을 최적화한 동적 계획법
	res = unboundedKnapsackDPComp(wgt, val, c)
	fmt.Printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res)
}
