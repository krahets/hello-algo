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
	/* 모든 순열 I */
	nums := []int{1, 2, 3}
	fmt.Printf("입력 배열 nums = ")
	PrintSlice(nums)

	res := permutationsI(nums)
	fmt.Printf("모든 순열 res = ")
	fmt.Println(res)
}

func TestPermutationII(t *testing.T) {
	nums := []int{1, 2, 2}
	fmt.Printf("입력 배열 nums = ")
	PrintSlice(nums)

	res := permutationsII(nums)
	fmt.Printf("모든 순열 res = ")
	fmt.Println(res)
}
