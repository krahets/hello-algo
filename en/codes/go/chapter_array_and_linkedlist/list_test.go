// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver code */
func TestList(t *testing.T) {
	/* Initialize the list */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("List nums =", nums)

	/* Access an element */
	num := nums[1] // Access the element at index 1
	fmt.Println("Access the element at index 1, giving num =", num)

	/* Update an element */
	nums[1] = 0 // Update the element at index 1 to 0
	fmt.Println("Update the element at index 1 to 0, giving nums =", nums)

	/* Clear the list */
	nums = nil
	fmt.Println("After clearing the list, nums =", nums)

	/* Append at the end */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("After adding elements, nums =", nums)

	/* Insert an element in the middle */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert the number 6 at index 3
	fmt.Println("Insert the number 6 at index 3, giving nums =", nums)

	/* Remove an element */
	nums = append(nums[:3], nums[4:]...) // Remove the element at index 3
	fmt.Println("Remove the element at index 3, giving nums =", nums)

	/* Traverse the list by index */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* Iterate directly over the list elements */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* Concatenate two lists */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Append list nums1 to nums
	fmt.Println("After appending list nums1 to nums, nums =", nums)

	/* Sort the list */
	sort.Ints(nums) // After sorting, the list elements are in ascending order
	fmt.Println("After sorting the list, nums =", nums)
}
