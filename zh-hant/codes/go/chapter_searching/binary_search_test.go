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
	// 在陣列中執行二分搜尋
	actual := binarySearch(nums, target)
	fmt.Println("目標元素 6 的索引 =", actual)
	if actual != expected {
		t.Errorf("目標元素 6 的索引 = %d，預期為 %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// 含有重複元素的陣列
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\n陣列 nums = ", nums)

	// 用二分搜尋找左界和右界
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("最左邊的元素", target, "的索引為", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("最右邊的元素", target, "的索引為", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// 不含重複元素的陣列
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("陣列 nums =", nums)

	// 用二分搜尋找插入點
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("元素", target, "的插入位置索引為", index)
	}

	// 含有重複元素的陣列
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\n陣列 nums =", nums)

	// 用二分搜尋找插入點
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("元素", target, "的插入位置索引為", index)
	}
}
