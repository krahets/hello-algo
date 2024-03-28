// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分搜尋插入點（無重複元素） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 初始化雙閉區間 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 計算中點索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 在區間 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target {
			// target 在區間 [i, m-1] 中
			j = m - 1
		} else {
			// 找到 target ，返回插入點 m
			return m
		}
	}
	// 未找到 target ，返回插入點 i
	return i
}

/* 二分搜尋插入點（存在重複元素） */
func binarySearchInsertion(nums []int, target int) int {
	// 初始化雙閉區間 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 計算中點索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 在區間 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target {
			// target 在區間 [i, m-1] 中
			j = m - 1
		} else {
			// 首個小於 target 的元素在區間 [i, m-1] 中
			j = m - 1
		}
	}
	// 返回插入點 i
	return i
}
