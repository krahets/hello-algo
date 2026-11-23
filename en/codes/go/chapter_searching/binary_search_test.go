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
	// Perform binary search on the array
	actual := binarySearch(nums, target)
	fmt.Println("Index of target element 6 =", actual)
	if actual != expected {
		t.Errorf("Index of target element 6 = %d; expected %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// Example array for a search that allows duplicates
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\nArray nums = ", nums)

	// Find the left and right boundaries using binary search
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("Leftmost occurrence of", target, "has index", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("Rightmost occurrence of", target, "has index", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// Array with no duplicate elements
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("Array nums =", nums)

	// Find an insertion point using binary search
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("Element", target, "has insertion point index", index)
	}

	// Example array for a search that allows duplicates
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\nArray nums =", nums)

	// Find an insertion point using binary search
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("Element", target, "has insertion point index", index)
	}
}
