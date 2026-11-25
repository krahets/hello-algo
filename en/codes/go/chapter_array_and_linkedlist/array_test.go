// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
Here we treat Go slices as arrays. This simplifies the examples
so we can focus on data structures and algorithms.
*/

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* Initialize the array */
	var arr [5]int
	fmt.Println("Array arr =", arr)
	// In Go, specifying the length ([5]int) gives an array, while omitting it ([]int) gives a slice
	// Go fixes array lengths at compile time, so the length must be a constant
	// To simplify the extend() function for extending an array, we use a slice as the array below
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Array nums =", nums)

	/* Random access */
	randomNum := randomAccess(nums)
	fmt.Println("Random element from nums:", randomNum)

	/* Extend the array */
	nums = extend(nums, 3)
	fmt.Println("After extending the array to length 8, nums =", nums)

	/* Insert an element */
	insert(nums, 6, 3)
	fmt.Println("After inserting 6 at index 3, nums =", nums)

	/* Remove an element */
	remove(nums, 2)
	fmt.Println("After removing the element at index 2, nums =", nums)

	/* Traverse the array */
	traverse(nums)

	/* Find an element */
	index := find(nums, 3)
	fmt.Println("Index of 3 in nums =", index)
}
