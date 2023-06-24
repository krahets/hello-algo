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

	fmt.Printf("target = " + strconv.Itoa(target) + ", 输入数组 nums = ")
	PrintSlice(nums)

	fmt.Println("所有和等于 " + strconv.Itoa(target) + " 的子集 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
	fmt.Println("请注意，该方法输出的结果包含重复集合")
}

func TestSubsetSumI(t *testing.T) {
	nums := []int{3, 4, 5}
	target := 9
	res := subsetSumI(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 输入数组 nums = ")
	PrintSlice(nums)

	fmt.Println("所有和等于 " + strconv.Itoa(target) + " 的子集 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}

func TestSubsetSumII(t *testing.T) {
	nums := []int{4, 4, 5}
	target := 9
	res := subsetSumII(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 输入数组 nums = ")
	PrintSlice(nums)

	fmt.Println("所有和等于 " + strconv.Itoa(target) + " 的子集 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}
