// File: quick_sort_test.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

// Быстрая сортировка
func TestQuickSort(t *testing.T) {
	q := quickSort{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("После быстрой сортировки nums = ", nums)
}

// Быстрая сортировка с выбором медианы в качестве опорного элемента
func TestQuickSortMedian(t *testing.T) {
	q := quickSortMedian{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("После быстрой сортировки с выбором медианы nums = ", nums)
}

// Быстрая сортировка с уменьшенной глубиной рекурсии
func TestQuickSortTailCall(t *testing.T) {
	q := quickSortTailCall{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("После быстрой сортировки с уменьшенной глубиной рекурсии nums = ", nums)
}
