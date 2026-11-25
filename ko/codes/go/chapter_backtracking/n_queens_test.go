// File: n_queens_test.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"
)

func TestNQueens(t *testing.T) {
	n := 4
	res := nQueens(n)

	fmt.Println("입력 체스판의 한 변의 길이: ", n)
	fmt.Println("퀸 배치 방법은 총 ", len(res), " 가지")
	for _, state := range res {
		fmt.Println("--------------------")
		for _, row := range state {
			fmt.Println(row)
		}
	}
}
