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
	// 配列で二分探索を行う
	actual := binarySearch(nums, target)
	fmt.Println("目的の要素 6 のインデックス =", actual)
	if actual != expected {
		t.Errorf("目的の要素 6 のインデックス = %d、期待値は %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// 重複要素を含む配列
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\n配列 nums = ", nums)

	// 二分探索で左境界と右境界を求める
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("最も左にある要素", target, "のインデックスは", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("最も右にある要素", target, "のインデックスは", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// 重複要素のない配列
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("配列 nums =", nums)

	// 二分探索による挿入位置の探索
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("要素", target, "の挿入位置のインデックスは", index)
	}

	// 重複要素を含む配列
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\n配列 nums =", nums)

	// 二分探索による挿入位置の探索
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("要素", target, "の挿入位置のインデックスは", index)
	}
}
