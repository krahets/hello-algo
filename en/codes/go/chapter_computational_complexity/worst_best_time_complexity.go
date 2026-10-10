// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* Generate an array with elements { 1, 2, ..., n }, order shuffled */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// Generate array nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// Randomly shuffle array elements
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* Find the index of number 1 in array nums */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// When element 1 is at the head of the array, best time complexity O(1) is achieved
		// When element 1 is at the tail of the array, worst time complexity O(n) is achieved
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
