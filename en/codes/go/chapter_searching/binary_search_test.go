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
	// Perform binary search in an array
	actual := binarySearch(nums, target)
	fmt.Println("Index of target element 6 =", actual)
	if actual != expected {
		t.Errorf("Index of target element 6 = %d, should be %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// Array with duplicate elements
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\nArray nums =", nums)

	// Binary search for left and right boundaries
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("The leftmost index of element", target, "is", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("The rightmost index of element", target, "is", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// Array without duplicate elements
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("Array nums =", nums)

	// Binary search for insertion point
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("The insertion point index of element", target, "is", index)
	}

	// Array with duplicate elements
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\nThe array nums =", nums)

	// Binary search for insertion point
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("The insertion point index of element", target, "is", index)
	}
}
