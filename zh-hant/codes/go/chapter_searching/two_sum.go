// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* 方法一：暴力列舉 */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// 兩層迴圈，時間複雜度為 O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; i < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* 方法二：輔助雜湊表 */
func twoSumHashTable(nums []int, target int) []int {
	// 輔助雜湊表，空間複雜度為 O(n)
	hashTable := map[int]int{}
	// 單層迴圈，時間複雜度為 O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
