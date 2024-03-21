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

	// 暴力搜尋
	res := editDistanceDFS(s, t, n, m)
	fmt.Printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res)

	// 記憶化搜尋
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, m+1)
		for j := 0; j <= m; j++ {
			mem[i][j] = -1
		}
	}
	res = editDistanceDFSMem(s, t, mem, n, m)
	fmt.Printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res)

	// 動態規劃
	res = editDistanceDP(s, t)
	fmt.Printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res)

	// 空間最佳化後的動態規劃
	res = editDistanceDPComp(s, t)
	fmt.Printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res)
}
