// File: radix_sort_test.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestRadixSort(t *testing.T) {
	/* 基数排序 */
	nums := []int{23, 12, 3, 4, 788, 192}
	radixSort(nums)
	fmt.Println("基数排序完成后 nums = ", nums)
}
