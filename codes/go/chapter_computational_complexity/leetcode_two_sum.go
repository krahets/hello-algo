// File: leetcode_two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_computational_complexity

// twoSumBruteForce
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	for i := 0; i < size-1; i++ {
		for j := i + 1; i < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

// twoSumHashTable
func twoSumHashTable(nums []int, target int) []int {
	hashTable := map[int]int{}
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
