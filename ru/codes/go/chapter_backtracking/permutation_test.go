// File: permutation_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPermutationI(t *testing.T) {
	/* Все перестановки I */
	nums := []int{1, 2, 3}
	fmt.Printf("Входной массив nums = ")
	PrintSlice(nums)

	res := permutationsI(nums)
	fmt.Printf("Все перестановки res = ")
	fmt.Println(res)
}

func TestPermutationII(t *testing.T) {
	nums := []int{1, 2, 2}
	fmt.Printf("Входной массив nums = ")
	PrintSlice(nums)

	res := permutationsII(nums)
	fmt.Printf("Все перестановки res = ")
	fmt.Println(res)
}
