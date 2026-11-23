// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* Binary search (closed interval) */
func binarySearch(nums []int, target int) int {
	// Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
	i, j := 0, len(nums)-1
	// Loop until the search interval is empty (when i > j)
	for i <= j {
		m := i + (j-i)/2      // Calculate the midpoint index m
		if nums[m] < target { // In this case, target must be in [m+1, j] if it exists
			i = m + 1
		} else if nums[m] > target { // In this case, target must be in [i, m-1] if it exists
			j = m - 1
		} else { // The target element was found; return its index
			return m
		}
	}
	// The target element was not found; return -1
	return -1
}

/* Binary search (left-closed, right-open interval) */
func binarySearchLCRO(nums []int, target int) int {
	// Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
	i, j := 0, len(nums)
	// Loop until the search interval is empty (when i = j)
	for i < j {
		m := i + (j-i)/2      // Calculate the midpoint index m
		if nums[m] < target { // In this case, target must be in [m+1, j) if it exists
			i = m + 1
		} else if nums[m] > target { // In this case, target must be in [i, m) if it exists
			j = m
		} else { // The target element was found; return its index
			return m
		}
	}
	// The target element was not found; return -1
	return -1
}
