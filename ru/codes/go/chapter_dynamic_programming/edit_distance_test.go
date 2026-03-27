// File: edit_distance_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import (
	"fmt"
	"testing"
)

func TestEditDistanceDFS(test *testing.T) {
	s := "bag"
	t := "pack"
	n := len(s)
	m := len(t)

	// Полный перебор
	res := editDistanceDFS(s, t, n, m)
	fmt.Printf("Чтобы преобразовать %s в %s, нужно минимум %d шагов\n", s, t, res)

	// Поиск с мемоизацией
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, m+1)
		for j := 0; j <= m; j++ {
			mem[i][j] = -1
		}
	}
	res = editDistanceDFSMem(s, t, mem, n, m)
	fmt.Printf("Чтобы преобразовать %s в %s, нужно минимум %d шагов\n", s, t, res)

	// Динамическое программирование
	res = editDistanceDP(s, t)
	fmt.Printf("Чтобы преобразовать %s в %s, нужно минимум %d шагов\n", s, t, res)

	// Динамическое программирование с оптимизацией памяти
	res = editDistanceDPComp(s, t)
	fmt.Printf("Чтобы преобразовать %s в %s, нужно минимум %d шагов\n", s, t, res)
}
