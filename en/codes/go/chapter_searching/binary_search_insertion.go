// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Find an insertion point using binary search (no duplicates) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// Initialize the closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Calculate the midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Target must be in [m+1, j] if it exists
			i = m + 1
		} else if nums[m] > target {
			// Target must be in [i, m-1] if it exists
			j = m - 1
		} else {
			// Target was found; return insertion point m
			return m
		}
	}
	// Target was not found; return insertion point i
	return i
}

/* Find an insertion point using binary search (with duplicates) */
func binarySearchInsertion(nums []int, target int) int {
	// Initialize the closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Calculate the midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Target must be in [m+1, j] if it exists
			i = m + 1
		} else if nums[m] > target {
			// Target must be in [i, m-1] if it exists
			j = m - 1
		} else {
			// Continue in [i, m-1] to find the rightmost element smaller than target
			j = m - 1
		}
	}
	// Return insertion point i
	return i
}
