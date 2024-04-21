// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* 方法一：暴力枚举 */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// 两层循环，时间复杂度为 O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* 方法二：辅助哈希表 */
func twoSumHashTable(nums []int, target int) []int {
	// 辅助哈希表，空间复杂度为 O(n)
	hashTable := map[int]int{}
	// 单层循环，时间复杂度为 O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
