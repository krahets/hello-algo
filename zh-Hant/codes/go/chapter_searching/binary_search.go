// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分搜尋（雙閉區間） */
func binarySearch(nums []int, target int) int {
	// 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
	i, j := 0, len(nums)-1
	// 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
	for i <= j {
		m := i + (j-i)/2      // 計算中點索引 m
		if nums[m] < target { // 此情況說明 target 在區間 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target { // 此情況說明 target 在區間 [i, m-1] 中
			j = m - 1
		} else { // 找到目標元素，返回其索引
			return m
		}
	}
	// 未找到目標元素，返回 -1
	return -1
}

/* 二分搜尋（左閉右開區間） */
func binarySearchLCRO(nums []int, target int) int {
	// 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
	i, j := 0, len(nums)
	// 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
	for i < j {
		m := i + (j-i)/2      // 計算中點索引 m
		if nums[m] < target { // 此情況說明 target 在區間 [m+1, j) 中
			i = m + 1
		} else if nums[m] > target { // 此情況說明 target 在區間 [i, m) 中
			j = m
		} else { // 找到目標元素，返回其索引
			return m
		}
	}
	// 未找到目標元素，返回 -1
	return -1
}
