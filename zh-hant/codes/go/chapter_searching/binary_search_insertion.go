// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 用二分搜尋找插入點（無重複元素） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 將閉區間設為 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 計算中點索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 若存在，必在區間 [m+1, j] 內
			i = m + 1
		} else if nums[m] > target {
			// target 若存在，必在區間 [i, m-1] 內
			j = m - 1
		} else {
			// 找到 target，回傳插入點 m
			return m
		}
	}
	// 找不到 target，回傳插入點 i
	return i
}

/* 用二分搜尋找插入點（有重複元素） */
func binarySearchInsertion(nums []int, target int) int {
	// 將閉區間設為 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 計算中點索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 若存在，必在區間 [m+1, j] 內
			i = m + 1
		} else if nums[m] > target {
			// target 若存在，必在區間 [i, m-1] 內
			j = m - 1
		} else {
			// 最右邊小於 target 的元素位於區間 [i, m-1] 內
			j = m - 1
		}
	}
	// 回傳插入點 i
	return i
}
