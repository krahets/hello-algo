// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* Generate a shuffled array containing { 1, 2, ..., n } */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// Generate the array nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// Shuffle the array elements at random
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* Find the index of 1 in the array nums */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// Best case: 1 is the first element, so the search takes O(1) time
		// Worst case: 1 is the last element, so the search takes O(n) time
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
