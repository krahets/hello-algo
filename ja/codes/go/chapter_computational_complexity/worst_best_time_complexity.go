// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// 配列 nums = { 1, 2, 3, ..., n } を生成
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// 配列要素をランダムにシャッフル
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* 配列 nums 内で数値 1 のインデックスを探す */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
		// 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
