// File: climbing_stairs_test.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import (
	"fmt"
	"testing"
)

func TestClimbingStairsBacktrack(t *testing.T) {
	n := 9
	res := climbingStairsBacktrack(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestClimbingStairsDFS(t *testing.T) {
	n := 9
	res := climbingStairsDFS(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestClimbingStairsDFSMem(t *testing.T) {
	n := 9
	res := climbingStairsDFSMem(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestClimbingStairsDP(t *testing.T) {
	n := 9
	res := climbingStairsDP(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestClimbingStairsDPComp(t *testing.T) {
	n := 9
	res := climbingStairsDPComp(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestClimbingStairsConstraintDP(t *testing.T) {
	n := 9
	res := climbingStairsConstraintDP(n)
	fmt.Printf("全 %d 段の階段の登り方は %d 通り\n", n, res)
}

func TestMinCostClimbingStairsDPComp(t *testing.T) {
	cost := []int{0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1}
	fmt.Printf("各段のコストの入力リストは %v\n", cost)

	res := minCostClimbingStairsDP(cost)
	fmt.Printf("階段を登りきる最小コストは %d\n", res)

	res = minCostClimbingStairsDPComp(cost)
	fmt.Printf("階段を登りきる最小コストは %d\n", res)
}
