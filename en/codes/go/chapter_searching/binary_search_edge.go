// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Binary search for the leftmost target */
func binarySearchLeftEdge(nums []int, target int) int {
	// Equivalent to finding the insertion point of target
	i := binarySearchInsertion(nums, target)
	// Target not found, return -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// Found target, return index i
	return i
}

/* Binary search for the rightmost target */
func binarySearchRightEdge(nums []int, target int) int {
	// Convert to finding the leftmost target + 1
	i := binarySearchInsertion(nums, target+1)
	// j points to the rightmost target, i points to the first element greater than target
	j := i - 1
	// Target not found, return -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// Found target, return index j
	return j
}
