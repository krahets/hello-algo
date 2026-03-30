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

	// Полный перебор
	res := minPathSumDFS(grid, n-1, m-1)
	fmt.Printf("Минимальная сумма пути из левого верхнего угла в правый нижний = %d\n", res)

	// Поиск с мемоизацией
	mem := make([][]int, n)
	for i := 0; i < n; i++ {
		mem[i] = make([]int, m)
		for j := 0; j < m; j++ {
			mem[i][j] = -1
		}
	}
	res = minPathSumDFSMem(grid, mem, n-1, m-1)
	fmt.Printf("Минимальная сумма пути из левого верхнего угла в правый нижний = %d\n", res)

	// Динамическое программирование
	res = minPathSumDP(grid)
	fmt.Printf("Минимальная сумма пути из левого верхнего угла в правый нижний = %d\n", res)

	// Динамическое программирование с оптимизацией памяти
	res = minPathSumDPComp(grid)
	fmt.Printf("Минимальная сумма пути из левого верхнего угла в правый нижний = %d\n", res)
}
