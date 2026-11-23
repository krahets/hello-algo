// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* Method 1: brute-force enumeration */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// Two nested loops give a time complexity of O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* Method 2: auxiliary hash table */
func twoSumHashTable(nums []int, target int) []int {
	// The auxiliary hash table uses O(n) space
	hashTable := map[int]int{}
	// A single loop gives a time complexity of O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
