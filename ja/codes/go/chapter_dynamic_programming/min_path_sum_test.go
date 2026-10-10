// File: min_path_sum_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import (
	"fmt"
	"testing"
)

func TestMinPathSum(t *testing.T) {
	grid := [][]int{
		{1, 3, 1, 5},
		{2, 2, 4, 2},
		{5, 3, 2, 1},
		{4, 3, 5, 2},
	}
	n, m := len(grid), len(grid[0])

	// 全探索
	res := minPathSumDFS(grid, n-1, m-1)
	fmt.Printf("左上から右下までの最小経路和は  %d\n", res)

	// メモ化探索
	mem := make([][]int, n)
	for i := 0; i < n; i++ {
		mem[i] = make([]int, m)
		for j := 0; j < m; j++ {
			mem[i][j] = -1
		}
	}
	res = minPathSumDFSMem(grid, mem, n-1, m-1)
	fmt.Printf("左上から右下までの最小経路和は  %d\n", res)

	// 動的計画法
	res = minPathSumDP(grid)
	fmt.Printf("左上から右下までの最小経路和は  %d\n", res)

	// 空間最適化後の動的計画法
	res = minPathSumDPComp(grid)
	fmt.Printf("左上から右下までの最小経路和は  %d\n", res)
}
