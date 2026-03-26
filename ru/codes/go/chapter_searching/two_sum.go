// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* Метод 1: полный перебор */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// Два вложенных цикла, временная сложность O(n^2)
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* Метод 2: вспомогательная хеш-таблица */
func twoSumHashTable(nums []int, target int) []int {
	// Вспомогательная хеш-таблица, пространственная сложность O(n)
	hashTable := map[int]int{}
	// Один цикл, временная сложность O(n)
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
