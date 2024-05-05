// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
我们将 Go 中的 Slice 切片看作 Array 数组。因为这样可以
降低理解成本，利于我们将关注点放在数据结构与算法上。
*/

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* Initialize an array */
	var arr [5]int
	fmt.Println("Array arr =", arr)
	// In Go, specifying length (e.g., [5]int) defines an array, whereas not specifying (e.g., []int) defines a slice
	// Since Go's arrays are designed with compile-time fixed length, only constants can be used to define their lengths
	// For ease of implementing an extend() function, we will treat slices (Slice) as arrays (Array) in the following discussions
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Array nums =", nums)

	/* Random access */
	randomNum := randomAccess(nums)
	fmt.Println("Retrieve a random element in nums", randomNum)

	/* Length extension */
	nums = extend(nums, 3)
	fmt.Println("Extend the array length to 8, resulting in nums =", nums)

	/* Insert element */
	insert(nums, 6, 3)
	fmt.Println("Insert number 6 at index 3, resulting in nums =", nums)

	/* Remove element */
	remove(nums, 2)
	fmt.Println("Remove the element at index 2, resulting in nums =", nums)

	/* Traverse array */
	traverse(nums)

	/* Search for elements */
	index := find(nums, 3)
	fmt.Println("Search for element 3 in nums, resulting in index =", index)
}
