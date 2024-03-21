// File: binary_search_recur_test.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import (
	"fmt"
	"testing"
)

func TestBinarySearch(t *testing.T) {
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	target := 6
	noTarget := 99
	targetIndex := binarySearch(nums, target)
	fmt.Println("目标元素 6 的索引 = ", targetIndex)
	noTargetIndex := binarySearch(nums, noTarget)
	fmt.Println("不存在目标元素的索引 = ", noTargetIndex)
}
