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

	fmt.Printf("target = " + strconv.Itoa(target) + ", 입력 배열 nums = ")
	PrintSlice(nums)

	fmt.Println("부분 집합의 합: " + strconv.Itoa(target) + " ; 해당하는 모든 부분 집합 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
	fmt.Println("이 방법의 출력 결과에는 중복 집합이 포함된다")
}

func TestSubsetSumI(t *testing.T) {
	nums := []int{3, 4, 5}
	target := 9
	res := subsetSumI(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 입력 배열 nums = ")
	PrintSlice(nums)

	fmt.Println("부분 집합의 합: " + strconv.Itoa(target) + " ; 해당하는 모든 부분 집합 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}

func TestSubsetSumII(t *testing.T) {
	nums := []int{4, 4, 5}
	target := 9
	res := subsetSumII(nums, target)

	fmt.Printf("target = " + strconv.Itoa(target) + ", 입력 배열 nums = ")
	PrintSlice(nums)

	fmt.Println("부분 집합의 합: " + strconv.Itoa(target) + " ; 해당하는 모든 부분 집합 res = ")
	for i := range res {
		PrintSlice(res[i])
	}
}
