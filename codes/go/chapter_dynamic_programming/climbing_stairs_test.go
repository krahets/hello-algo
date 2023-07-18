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
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestClimbingStairsDFS(t *testing.T) {
	n := 9
	res := climbingStairsDFS(n)
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestClimbingStairsDFSMem(t *testing.T) {
	n := 9
	res := climbingStairsDFSMem(n)
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestClimbingStairsDP(t *testing.T) {
	n := 9
	res := climbingStairsDP(n)
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestClimbingStairsDPComp(t *testing.T) {
	n := 9
	res := climbingStairsDPComp(n)
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestClimbingStairsConstraintDP(t *testing.T) {
	n := 9
	res := climbingStairsConstraintDP(n)
	fmt.Printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res)
}

func TestMinCostClimbingStairsDPComp(t *testing.T) {
	cost := []int{0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1}
	fmt.Printf("输入楼梯的代价列表为 %v\n", cost)

	res := minCostClimbingStairsDP(cost)
	fmt.Printf("爬完楼梯的最低代价为 %d\n", res)

	res = minCostClimbingStairsDPComp(cost)
	fmt.Printf("爬完楼梯的最低代价为 %d\n", res)
}

func TestMinPathSum(t *testing.T) {
	grid := [][]int{
		{1, 3, 1, 5},
		{2, 2, 4, 2},
		{5, 3, 2, 1},
		{4, 3, 5, 2},
	}
	n, m := len(grid), len(grid[0])

	// 暴力搜索
	res := minPathSumDFS(grid, n-1, m-1)
	fmt.Printf("从左上角到右下角的做小路径和为  %d\n", res)

	// 记忆化搜索
	mem := make([][]int, n)
	for i := 0; i < n; i++ {
		mem[i] = make([]int, m)
		for j := 0; j < m; j++ {
			mem[i][j] = -1
		}
	}
	res = minPathSumDFSMem(grid, mem, n-1, m-1)
	fmt.Printf("从左上角到右下角的做小路径和为  %d\n", res)

	// 动态规划
	res = minPathSumDP(grid)
	fmt.Printf("从左上角到右下角的做小路径和为  %d\n", res)

	// 状态压缩后的动态规划
	res = minPathSumDPComp(grid)
	fmt.Printf("从左上角到右下角的做小路径和为  %d\n", res)
}
