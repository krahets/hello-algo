// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* 方法 1：総当たり列挙 */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// 2重ループのため、時間計算量は O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* 方法 2：補助ハッシュテーブル */
func twoSumHashTable(nums []int, target int) []int {
	// 補助ハッシュテーブルを使用し、空間計算量は O(n)
	hashTable := map[int]int{}
	// 単一ループで、時間計算量は O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
