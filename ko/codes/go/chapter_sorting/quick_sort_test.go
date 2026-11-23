// File: quick_sort_test.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

// 퀵 정렬
func TestQuickSort(t *testing.T) {
	q := quickSort{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("퀵 정렬을 마친 후 nums = ", nums)
}

// 퀵 정렬(중앙값 피벗 최적화)
func TestQuickSortMedian(t *testing.T) {
	q := quickSortMedian{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("퀵 정렬(중앙값 피벗 최적화)을 마친 후 nums = ", nums)
}

// 퀵 정렬(재귀 깊이 최적화)
func TestQuickSortTailCall(t *testing.T) {
	q := quickSortTailCall{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("퀵 정렬(재귀 깊이 최적화)을 마친 후 nums = ", nums)
}
