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

	// [region]{access_element}
	/* Access an element */
	num := nums[1] // Access the element at index 1
	// [endregion]{access_element}
	fmt.Println("Access the element at index 1, giving num =", num)

	// [region]{update_element}
	/* Update an element */
	nums[1] = 0 // Update the element at index 1 to 0
	// [endregion]{update_element}
	fmt.Println("Update the element at index 1 to 0, giving nums =", nums)

	// [region]{clear_list}
	/* Clear the list */
	nums = nil
	// [endregion]{clear_list}
	fmt.Println("After clearing the list, nums =", nums)

	// [region]{append_element}
	/* Append at the end */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	// [endregion]{append_element}
	fmt.Println("After adding elements, nums =", nums)

	// [region]{insert_element}
	/* Insert an element in the middle */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert the number 6 at index 3
	// [endregion]{insert_element}
	fmt.Println("Insert the number 6 at index 3, giving nums =", nums)

	// [region]{remove_element}
	/* Remove an element */
	nums = append(nums[:3], nums[4:]...) // Remove the element at index 3
	// [endregion]{remove_element}
	fmt.Println("Remove the element at index 3, giving nums =", nums)

	// [region]{iterate_list}
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
	// [endregion]{iterate_list}

	// [region]{concat_list}
	/* Concatenate two lists */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Append list nums1 to nums
	// [endregion]{concat_list}
	fmt.Println("After appending list nums1 to nums, nums =", nums)

	// [region]{sort_list}
	/* Sort the list */
	sort.Ints(nums) // After sorting, the list elements are in ascending order
	// [endregion]{sort_list}
	fmt.Println("After sorting the list, nums =", nums)
}
