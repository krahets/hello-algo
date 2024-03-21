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
	// 包含重复元素的数组
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\n数组 nums = ", nums)

	// 二分查找左边界和右边界
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("最左一个元素", target, "的索引为", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("最右一个元素", target, "的索引为", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// 无重复元素的数组
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("数组 nums =", nums)

	// 二分查找插入点
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("元素", target, "的插入点的索引为", index)
	}

	// 包含重复元素的数组
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\n数组 nums =", nums)

	// 二分查找插入点
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("元素", target, "的插入点的索引为", index)
	}
}
