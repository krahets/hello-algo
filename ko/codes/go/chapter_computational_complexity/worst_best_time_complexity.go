// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 배열 nums = { 1, 2, 3, ..., n }을 만든다
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 배열의 원소를 무작위로 섞는다
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* 배열 nums에서 1의 인덱스를 찾는다 */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
		// 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
