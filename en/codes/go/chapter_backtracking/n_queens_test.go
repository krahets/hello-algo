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

	fmt.Println("Input board size is ", n)
	fmt.Println("Total queen placement solutions: ", len(res), " solutions")
	for _, state := range res {
		fmt.Println("--------------------")
		for _, row := range state {
			fmt.Println(row)
		}
	}
}
