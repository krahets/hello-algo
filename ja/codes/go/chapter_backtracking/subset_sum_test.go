// File: subset_sum_test.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestSubsetSumINaive(t *testing.T) {
	nums := []int{3, 4, 5}
	target := 9
	res := subsetSumINaive(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 入力配列 nums = ")
	PrintSlice(nums)

	fmt.Println("要素の和が " + strconv.Itoa(target) + " となるすべての部分集合 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
	fmt.Println("この方法の出力には重複する集合が含まれる点に注意")
}

func TestSubsetSumI(t *testing.T) {
	nums := []int{3, 4, 5}
	target := 9
	res := subsetSumI(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 入力配列 nums = ")
	PrintSlice(nums)

	fmt.Println("要素の和が " + strconv.Itoa(target) + " となるすべての部分集合 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}

func TestSubsetSumII(t *testing.T) {
	nums := []int{4, 4, 5}
	target := 9
	res := subsetSumII(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 入力配列 nums = ")
	PrintSlice(nums)

	fmt.Println("要素の和が " + strconv.Itoa(target) + " となるすべての部分集合 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}
