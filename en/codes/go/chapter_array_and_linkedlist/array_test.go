// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
We treat Go slices as arrays in these examples. This simplifies the explanation
and lets us focus on data structures and algorithms.
*/

import (
	"fmt"
	"testing"
)

/* Driver code */
func TestArray(t *testing.T) {
	/* Initialize the array */
	var arr [5]int
	fmt.Println("Array arr =", arr)
	// In Go, a type with a specified length ([5]int) is an array; without a length ([]int), it is a slice
	// Go array lengths are determined at compile time, so the length must be a constant
	// To make the extend() function easier to implement, we treat slices as arrays below
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Array nums =", nums)

	/* Random access */
	randomNum := randomAccess(nums)
	fmt.Println("Randomly selected element from nums:", randomNum)

	/* Extend the length */
	nums = extend(nums, 3)
	fmt.Println("Extend the array length to 8, giving nums =", nums)

	/* Insert an element */
	insert(nums, 6, 3)
	fmt.Println("Insert the number 6 at index 3, giving nums =", nums)

	/* Remove an element */
	remove(nums, 2)
	fmt.Println("Remove the element at index 2, giving nums =", nums)

	/* Traverse the array */
	traverse(nums)

	/* Find an element */
	index := find(nums, 3)
	fmt.Println("Find element 3 in nums, giving index =", index)
}
