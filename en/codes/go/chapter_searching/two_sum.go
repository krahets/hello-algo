// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* Method 1: Brute force enumeration */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// Two nested loops, time complexity is O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* Method 2: Auxiliary hash table */
func twoSumHashTable(nums []int, target int) []int {
	// Auxiliary hash table, space complexity is O(n)
	hashTable := map[int]int{}
	// Single loop, time complexity is O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
