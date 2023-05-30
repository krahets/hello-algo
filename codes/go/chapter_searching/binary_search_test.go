// File: binary_search_test.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestBinarySearch(t *testing.T) {
	var (
		target   = 6
		nums     = []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
		expected = 2
	)
	// 在数组中执行二分查找
	actual := binarySearch(nums, target)
	fmt.Println("目标元素 6 的索引 =", actual)
	if actual != expected {
		t.Errorf("目标元素 6 的索引 = %d, 应该为 %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	target := 6
	nums := []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	// 二分查找最左一个元素
	indexLeft := binarySearchLeftEdge(nums, target)
	fmt.Println("数组中最左一个元素 6 的索引 = ", indexLeft)

	// 二分查找最右一个元素
	indexRight := binarySearchRightEdge(nums, target)
	fmt.Println("数组中最右一个元素 6 的索引 = ", indexRight)
}
