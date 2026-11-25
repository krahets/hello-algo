// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* Binary search on a closed interval */
func binarySearch(nums []int, target int) int {
	// Initialize the closed interval [0, n-1] with i at the first element and j at the last
	i, j := 0, len(nums)-1
	// Stop when the search interval is empty (i > j)
	for i <= j {
		m := i + (j-i)/2      // Compute the midpoint index m
		if nums[m] < target { // Any match must lie in [m+1, j]
			i = m + 1
		} else if nums[m] > target { // Any match must lie in [i, m-1]
			j = m - 1
		} else { // Found the target. Return its index
			return m
		}
	}
	// Target not found. Return -1
	return -1
}

/* Binary search on a left-closed, right-open interval */
func binarySearchLCRO(nums []int, target int) int {
	// Initialize [0, n) with i at the first element and j one past the last
	i, j := 0, len(nums)
	// Stop when the search interval is empty (i = j)
	for i < j {
		m := i + (j-i)/2      // Compute the midpoint index m
		if nums[m] < target { // Any match must lie in [m+1, j)
			i = m + 1
		} else if nums[m] > target { // Any match must lie in [i, m)
			j = m
		} else { // Found the target. Return its index
			return m
		}
	}
	// Target not found. Return -1
	return -1
}
