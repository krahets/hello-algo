// File: selection_sort_test.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestSelectionSort(t *testing.T) {
	nums := []int{4, 1, 3, 1, 5, 2}
	selectionSort(nums)
	fmt.Println("After selection sort completes, nums = ", nums)
}
