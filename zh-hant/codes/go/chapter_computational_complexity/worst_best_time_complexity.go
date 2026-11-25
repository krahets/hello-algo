// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 建立陣列 nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 隨機打亂陣列元素
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* 在陣列 nums 中尋找數字 1 的索引 */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// 若 1 在陣列開頭，最佳時間複雜度為 O(1)
		// 若 1 在陣列末端，最差時間複雜度為 O(n)
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
