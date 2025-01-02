// File: bubble_sort_test.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestBubbleSort(t *testing.T) {
	nums := []int{4, 1, 3, 1, 5, 2}
	bubbleSort(nums)
	fmt.Println("冒泡排序完成后 nums = ", nums)

	nums1 := []int{4, 1, 3, 1, 5, 2}
	bubbleSortWithFlag(nums1)
	fmt.Println("冒泡排序完成后 nums1 = ", nums1)
}
