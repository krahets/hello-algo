// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import "math/rand"

// randomNumbers 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 生成数组 nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 随机打乱数组元素
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

// findOne 查找数组 nums 中数字 1 所在索引
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}