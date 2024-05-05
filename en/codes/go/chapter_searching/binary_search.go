// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* Binary search (double closed interval) */
func binarySearch(nums []int, target int) int {
	// Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
	i, j := 0, len(nums)-1
	// Loop until the search interval is empty (when i > j, it is empty)
	for i <= j {
		m := i + (j-i)/2      // Calculate midpoint index m
		if nums[m] < target { // This situation indicates that target is in the interval [m+1, j]
			i = m + 1
		} else if nums[m] > target { // This situation indicates that target is in the interval [i, m-1]
			j = m - 1
		} else { // Found the target element, thus return its index
			return m
		}
	}
	// Did not find the target element, thus return -1
	return -1
}

/* Binary search (left closed right open interval) */
func binarySearchLCRO(nums []int, target int) int {
	// Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
	i, j := 0, len(nums)
	// Loop until the search interval is empty (when i = j, it is empty)
	for i < j {
		m := i + (j-i)/2      // Calculate midpoint index m
		if nums[m] < target { // This situation indicates that target is in the interval [m+1, j)
			i = m + 1
		} else if nums[m] > target { // This situation indicates that target is in the interval [i, m)
			j = m
		} else { // Found the target element, thus return its index
			return m
		}
	}
	// Did not find the target element, thus return -1
	return -1
}
