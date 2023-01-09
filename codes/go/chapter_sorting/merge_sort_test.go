// File: merge_sort_test.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestMergeSort(t *testing.T) {
	nums := []int{7, 3, 2, 6, 0, 1, 5, 4}
	mergeSort(nums, 0, len(nums)-1)
	fmt.Println("归并排序完成后 nums = ", nums)
}
