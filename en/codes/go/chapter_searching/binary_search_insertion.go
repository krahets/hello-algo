// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Binary search for an insertion point (no duplicates) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// Initialize the closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Compute the midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Any match must lie in [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Any match must lie in [i, m-1]
			j = m - 1
		} else {
			// Found target. Return insertion point m
			return m
		}
	}
	// Target not found. Return insertion point i
	return i
}

/* Binary search for an insertion point (duplicates allowed) */
func binarySearchInsertion(nums []int, target int) int {
	// Initialize the closed interval [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Compute the midpoint index m
		m := i + (j-i)/2
		if nums[m] < target {
			// Any match must lie in [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Any match must lie in [i, m-1]
			j = m - 1
		} else {
			// Look in [i, m-1] for the rightmost element less than target
			j = m - 1
		}
	}
	// Return insertion point i
	return i
}
