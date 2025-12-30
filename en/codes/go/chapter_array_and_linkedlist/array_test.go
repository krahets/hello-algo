// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
We treat Go Slice as Array here. This reduces
the learning cost and allows us to focus on data structures and algorithms.
*/

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* Initialize array */
	var arr [5]int
	fmt.Println("Array arr =", arr)
	// In Go, specifying length ([5]int) creates an array, not specifying length ([]int) creates a slice
	// Since Go arrays are designed to have their length determined at compile time, only constants can be used to specify the length
	// For convenience in implementing the extend() function, slices are treated as arrays below
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Array nums =", nums)

	/* Insert element */
	randomNum := randomAccess(nums)
	fmt.Println("Get random element in nums", randomNum)

	/* Traverse array */
	nums = extend(nums, 3)
	fmt.Println("Extend array length to 8, get nums =", nums)

	/* Insert element */
	insert(nums, 6, 3)
	fmt.Println("Insert number 6 at index 3, get nums =", nums)

	/* Remove element */
	remove(nums, 2)
	fmt.Println("Remove element at index 2, get nums =", nums)

	/* Traverse array */
	traverse(nums)

	/* Find element */
	index := find(nums, 3)
	fmt.Println("Find element 3 in nums, get index =", index)
}
