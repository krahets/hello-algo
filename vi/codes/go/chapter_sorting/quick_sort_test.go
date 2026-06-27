// File: quick_sort_test.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

// Quick sort
func TestQuickSort(t *testing.T) {
	q := quickSort{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("After quick sort completes, nums = ", nums)
}

// Quick sort (recursion depth optimization)
func TestQuickSortMedian(t *testing.T) {
	q := quickSortMedian{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("After quick sort (median pivot optimization), nums = ", nums)
}

// Quick sort (recursion depth optimization)
func TestQuickSortTailCall(t *testing.T) {
	q := quickSortTailCall{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("After quick sort (recursion depth optimization), nums = ", nums)
}
