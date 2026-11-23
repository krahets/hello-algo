// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 배열 nums = { 1, 2, 3, ..., n }을 생성한다
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 배열 원소를 무작위로 섞는다
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
		// 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
