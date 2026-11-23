// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Find the leftmost occurrence of target using binary search */
func binarySearchLeftEdge(nums []int, target int) int {
	// This is equivalent to finding the insertion point of target
	i := binarySearchInsertion(nums, target)
	// If target was not found, return -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// Target was found; return index i
	return i
}

/* Find the rightmost occurrence of target using binary search */
func binarySearchRightEdge(nums []int, target int) int {
	// For integer values, find the leftmost insertion point of target + 1 (assuming no overflow)
	i := binarySearchInsertion(nums, target+1)
	// i is the index of the first element greater than target (or len(nums)); j is the candidate index of the rightmost target
	j := i - 1
	// If target was not found, return -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// Target was found; return index j
	return j
}
