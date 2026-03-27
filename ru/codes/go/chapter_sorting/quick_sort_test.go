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
	fmt.Println("После быстрой сортировки nums =", nums)
}

// Быстрая сортировка (оптимизация медианным опорным элементом)
func TestQuickSortMedian(t *testing.T) {
	q := quickSortMedian{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("После быстрой сортировки (оптимизация медианным опорным элементом) nums =", nums)
}

// Быстрая сортировка (оптимизация глубины рекурсии)
func TestQuickSortTailCall(t *testing.T) {
	q := quickSortTailCall{}
	nums := []int{4, 1, 3, 1, 5, 2}
	q.quickSort(nums, 0, len(nums)-1)
	fmt.Println("После быстрой сортировки (оптимизация глубины рекурсии) nums =", nums)
}
