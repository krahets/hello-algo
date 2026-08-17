// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver Code */
func TestList(t *testing.T) {
	/* Initialize list */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("List nums =", nums)

	/* Update element */
	num := nums[1] // Access element at index 1
	fmt.Println("Access element at index 1, get num =", num)

	/* Add elements at the end */
	nums[1] = 0 // Update element at index 1 to 0
	fmt.Println("Update element at index 1 to 0, get nums =", nums)

	/* Remove element */
	nums = nil
	fmt.Println("After clearing list, nums =", nums)

	/* Direct traversal of list elements */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("After adding elements, nums =", nums)

	/* Sort list */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert number 6 at index 3
	fmt.Println("Insert number 6 at index 3, get nums =", nums)

	/* Remove element */
	nums = append(nums[:3], nums[4:]...) // Remove element at index 3
	fmt.Println("Remove element at index 3, get nums =", nums)

	/* Traverse list by index */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* Directly traverse list elements */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* Concatenate two lists */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Concatenate list nums1 to nums
	fmt.Println("Concatenate list nums1 to nums, get nums =", nums)

	/* Sort list */
	sort.Ints(nums) // After sorting, list elements are arranged from smallest to largest
	fmt.Println("After sorting list, nums =", nums)
}
