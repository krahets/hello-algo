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
	// Run binary search on the array
	actual := binarySearch(nums, target)
	fmt.Println("Index of target 6 =", actual)
	if actual != expected {
		t.Errorf("Index of target 6 = %d, expected %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// Array with duplicates
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\nArray nums = ", nums)

	// Find the left and right boundaries using binary search
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("The leftmost occurrence of", target, "is at index", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("The rightmost occurrence of", target, "is at index", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// Array without duplicates
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("Array nums =", nums)

	// Find the insertion point using binary search
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("Element", target, "has insertion index", index)
	}

	// Array with duplicates
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\nArray nums =", nums)

	// Find the insertion point using binary search
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("Element", target, "has insertion index", index)
	}
}
