// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* Binary search (closed interval on both sides) */
func binarySearch(nums []int, target int) int {
	// Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
	i, j := 0, len(nums)-1
	// Loop, exit when the search interval is empty (empty when i > j)
	for i <= j {
		m := i + (j-i)/2      // Calculate the midpoint index m
		if nums[m] < target { // This means target is in the interval [m+1, j]
			i = m + 1
		} else if nums[m] > target { // This means target is in the interval [i, m-1]
			j = m - 1
		} else { // Found the target element, return its index
			return m
		}
	}
	// Target element not found, return -1
	return -1
}

/* Binary search (left-closed right-open interval) */
func binarySearchLCRO(nums []int, target int) int {
	// Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
	i, j := 0, len(nums)
	// Loop, exit when the search interval is empty (empty when i = j)
	for i < j {
		m := i + (j-i)/2      // Calculate the midpoint index m
		if nums[m] < target { // This means target is in the interval [m+1, j)
			i = m + 1
		} else if nums[m] > target { // This means target is in the interval [i, m)
			j = m
		} else { // Found the target element, return its index
			return m
		}
	}
	// Target element not found, return -1
	return -1
}
