// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Binary search: problem f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// An empty interval contains no target, so return -1
	if i > j {
		return -1
	}
	//	Compute the middle index
	m := i + ((j - i) >> 1)
	//Compare the middle element with the target
	if nums[m] < target {
		// If smaller, search the right half recursively
		// Recursively solve f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// If larger, search the left half recursively
		// Recursively solve f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// Target found: return its index
		return m
	}
}

/* Binary search */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
