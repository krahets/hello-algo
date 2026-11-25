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

	fmt.Println("盤面の一辺の長さ： ", n)
	fmt.Println("クイーンの配置は全部で ", len(res), " 通り")
	for _, state := range res {
		fmt.Println("--------------------")
		for _, row := range state {
			fmt.Println(row)
		}
	}
}
