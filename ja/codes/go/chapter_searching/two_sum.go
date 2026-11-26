// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* 方法 1：総当たり */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// 二重ループの時間計算量は O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* 方法 2：補助のハッシュテーブルを使う */
func twoSumHashTable(nums []int, target int) []int {
	// 補助のハッシュテーブルの空間計算量は O(n)
	hashTable := map[int]int{}
	// 一重ループの時間計算量は O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
