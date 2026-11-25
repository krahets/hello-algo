// File: two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

/* 방법 1. 모든 조합 확인 */
func twoSumBruteForce(nums []int, target int) []int {
	size := len(nums)
	// 이중 반복문을 사용하므로 시간 복잡도는 O(n^2)이다.
	for i := 0; i < size-1; i++ {
		for j := i + 1; j < size; j++ {
			if nums[i]+nums[j] == target {
				return []int{i, j}
			}
		}
	}
	return nil
}

/* 방법 2. 보조 해시 테이블 사용 */
func twoSumHashTable(nums []int, target int) []int {
	// 보조 해시 테이블을 사용하므로 공간 복잡도는 O(n)이다.
	hashTable := map[int]int{}
	// 반복문 하나만 사용하므로 시간 복잡도는 O(n)이다.
	for idx, val := range nums {
		if preIdx, ok := hashTable[target-val]; ok {
			return []int{preIdx, idx}
		}
		hashTable[val] = idx
	}
	return nil
}
