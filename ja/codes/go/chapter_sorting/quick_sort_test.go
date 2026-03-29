// File: quick_sort_test.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

// クイックソート
func TestQuickSort(t *testing.T) {
	q := quickSort{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("クイックソート完了後 nums = ", nums)
}

// クイックソート（中央値の基準値で最適化）
func TestQuickSortMedian(t *testing.T) {
	q := quickSortMedian{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("クイックソート（中央値ピボット最適化）完了後 nums = ", nums)
}

// クイックソート（再帰深度最適化）
func TestQuickSortTailCall(t *testing.T) {
	q := quickSortTailCall{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("クイックソート（再帰深度最適化）完了後 nums = ", nums)
}
