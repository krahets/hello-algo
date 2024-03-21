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
	nums := []int{10546151, 35663510, 42865989, 34862445, 81883077,
		88906420, 72429244, 30524779, 82060337, 63832996}
	radixSort(nums)
	fmt.Println("基数排序完成后 nums = ", nums)
}
