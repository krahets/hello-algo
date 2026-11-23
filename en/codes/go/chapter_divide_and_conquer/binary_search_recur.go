// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Binary search: problem f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// If the interval is empty, the target is absent; return -1
	if i > j {
		return -1
	}
	//	Calculate the midpoint index
	m := i + ((j - i) >> 1)
	//Compare the midpoint element with the target
	if nums[m] < target {
		// If it is smaller, recurse on the right half
		// Recurse on subproblem f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// If it is larger, recurse on the left half
		// Recurse on subproblem f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// The target element was found; return its index
		return m
	}
}

/* Binary search */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
