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
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestClimbingStairsDFS(t *testing.T) {
	n := 9
	res := climbingStairsDFS(n)
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestClimbingStairsDFSMem(t *testing.T) {
	n := 9
	res := climbingStairsDFSMem(n)
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestClimbingStairsDP(t *testing.T) {
	n := 9
	res := climbingStairsDP(n)
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestClimbingStairsDPComp(t *testing.T) {
	n := 9
	res := climbingStairsDPComp(n)
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestClimbingStairsConstraintDP(t *testing.T) {
	n := 9
	res := climbingStairsConstraintDP(n)
	fmt.Printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res)
}

func TestMinCostClimbingStairsDPComp(t *testing.T) {
	cost := []int{0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1}
	fmt.Printf("입력한 계단의 비용 리스트: %v\n", cost)

	res := minCostClimbingStairsDP(cost)
	fmt.Printf("계단을 끝까지 오르는 최소 비용은 %d이다\n", res)

	res = minCostClimbingStairsDPComp(cost)
	fmt.Printf("계단을 끝까지 오르는 최소 비용은 %d이다\n", res)
}
