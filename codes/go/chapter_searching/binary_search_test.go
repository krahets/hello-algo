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
		target   = 3
		nums     = []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
		expected = 2
	)
	// 在数组中执行二分查找
	actual := binarySearch(nums, target)
	fmt.Println("目标元素 3 的索引 =", actual)
	if actual != expected {
		t.Errorf("目标元素 3 的索引 = %d, 应该为 %d", actual, expected)
	}
}
