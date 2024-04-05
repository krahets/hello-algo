// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 生成陣列 nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 隨機打亂陣列元素
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* 查詢陣列 nums 中數字 1 所在索引 */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
		// 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
