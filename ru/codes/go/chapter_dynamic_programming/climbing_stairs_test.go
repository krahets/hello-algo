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
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestClimbingStairsDFS(t *testing.T) {
	n := 9
	res := climbingStairsDFS(n)
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestClimbingStairsDFSMem(t *testing.T) {
	n := 9
	res := climbingStairsDFSMem(n)
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestClimbingStairsDP(t *testing.T) {
	n := 9
	res := climbingStairsDP(n)
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestClimbingStairsDPComp(t *testing.T) {
	n := 9
	res := climbingStairsDPComp(n)
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestClimbingStairsConstraintDP(t *testing.T) {
	n := 9
	res := climbingStairsConstraintDP(n)
	fmt.Printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res)
}

func TestMinCostClimbingStairsDPComp(t *testing.T) {
	cost := []int{0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1}
	fmt.Printf("Стоимость ступеней: %v\n", cost)

	res := minCostClimbingStairsDP(cost)
	fmt.Printf("Минимальная стоимость подъёма: %d\n", res)

	res = minCostClimbingStairsDPComp(cost)
	fmt.Printf("Минимальная стоимость подъёма: %d\n", res)
}
