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

	// Brute-force search
	res := editDistanceDFS(s, t, n, m)
	fmt.Printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res)

	// Memoization search
	mem := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		mem[i] = make([]int, m+1)
		for j := 0; j <= m; j++ {
			mem[i][j] = -1
		}
	}
	res = editDistanceDFSMem(s, t, mem, n, m)
	fmt.Printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res)

	// Dynamic programming
	res = editDistanceDP(s, t)
	fmt.Printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res)

	// Space-optimized dynamic programming
	res = editDistanceDPComp(s, t)
	fmt.Printf("Changing %s to %s requires a minimum of %d edits\n", s, t, res)
}
