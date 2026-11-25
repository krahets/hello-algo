// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Use binary search to find the leftmost occurrence of target */
func binarySearchLeftEdge(nums []int, target int) int {
	// Equivalent to finding the insertion point for target
	i := binarySearchInsertion(nums, target)
	// Target not found. Return -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// Found target. Return index i
	return i
}

/* Use binary search to find the rightmost occurrence of target */
func binarySearchRightEdge(nums []int, target int) int {
	// Search for the leftmost occurrence of target + 1
	i := binarySearchInsertion(nums, target+1)
	// j points to the rightmost occurrence of target, and i to the first larger element
	j := i - 1
	// Target not found. Return -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// Found target. Return index j
	return j
}
