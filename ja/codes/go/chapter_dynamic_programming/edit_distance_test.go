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

	// 全探索
	res := editDistanceDFS(s, t, n, m)
	fmt.Printf("%s を %s に変更するには最低 %d 回の編集が必要です\n", s, t, res)

	// メモ化探索
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, m+1)
		for j := 0; j <= m; j++ {
			mem[i][j] = -1
		}
	}
	res = editDistanceDFSMem(s, t, mem, n, m)
	fmt.Printf("%s を %s に変更するには最低 %d 回の編集が必要です\n", s, t, res)

	// 動的計画法
	res = editDistanceDP(s, t)
	fmt.Printf("%s を %s に変更するには最低 %d 回の編集が必要です\n", s, t, res)

	// 空間最適化後の動的計画法
	res = editDistanceDPComp(s, t)
	fmt.Printf("%s を %s に変更するには最低 %d 回の編集が必要です\n", s, t, res)
}
