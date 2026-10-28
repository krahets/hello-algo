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

	// 완전 탐색
	res := editDistanceDFS(s, t, n, m)
	fmt.Printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res)

	// 메모이제이션을 이용한 탐색
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, m+1)
		for j := 0; j <= m; j++ {
			mem[i][j] = -1
		}
	}
	res = editDistanceDFSMem(s, t, mem, n, m)
	fmt.Printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res)

	// 동적 계획법
	res = editDistanceDP(s, t)
	fmt.Printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res)

	// 공간을 최적화한 동적 계획법
	res = editDistanceDPComp(s, t)
	fmt.Printf("%s에서 %s로 바꾸려면 최소 %d회의 편집이 필요하다\n", s, t, res)
}
