// File: counting_sort_test.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestCountingSort(t *testing.T) {
	nums := []int{1, 0, 1, 2, 0, 4, 0, 2, 2, 4}
	countingSortNaive(nums)
	fmt.Println("计数排序（无法排序对象）完成后 nums = ", nums)

	nums1 := []int{1, 0, 1, 2, 0, 4, 0, 2, 2, 4}
	countingSort(nums1)
	fmt.Println("计数排序完成后 nums1 = ", nums1)
}
