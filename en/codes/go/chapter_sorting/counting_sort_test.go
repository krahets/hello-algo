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
	fmt.Println("After counting sort (cannot sort objects) completes, nums = ", nums)

	nums1 := []int{1, 0, 1, 2, 0, 4, 0, 2, 2, 4}
	countingSort(nums1)
	fmt.Println("After counting sort completes, nums1 = ", nums1)
}
