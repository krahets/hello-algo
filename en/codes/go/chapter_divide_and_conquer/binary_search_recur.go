// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Binary search: problem f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// If interval is empty, indicating no target element, return -1
	if i > j {
		return -1
	}
	// Calculate midpoint index
	m := i + ((j - i) >> 1)
	// Compare midpoint with target element
	if nums[m] < target {
		// If smaller, recurse on right half of array
		// Recursion subproblem f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// If larger, recurse on left half of array
		// Recursion subproblem f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// Found the target element, return its index
		return m
	}
}

/* Binary search */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
