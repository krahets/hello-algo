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

	// 완전 탐색
	res := minPathSumDFS(grid, n-1, m-1)
	fmt.Printf("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 %d이다\n", res)

	// 메모이제이션을 이용한 탐색
	mem := make([][]int, n)
	for i := 0; i < n; i++ {
		mem[i] = make([]int, m)
		for j := 0; j < m; j++ {
			mem[i][j] = -1
		}
	}
	res = minPathSumDFSMem(grid, mem, n-1, m-1)
	fmt.Printf("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 %d이다\n", res)

	// 동적 계획법
	res = minPathSumDP(grid)
	fmt.Printf("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 %d이다\n", res)

	// 공간을 최적화한 동적 계획법
	res = minPathSumDPComp(grid)
	fmt.Printf("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 %d이다\n", res)
}
