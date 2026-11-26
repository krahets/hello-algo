// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分搜尋（閉區間） */
func binarySearch(nums []int, target int) int {
	// 將閉區間設為 [0, n-1]，i 和 j 分別指向陣列的首、末元素
	i, j := 0, len(nums)-1
	// 當搜尋區間為空（i > j）時，結束迴圈
	for i <= j {
		m := i + (j-i)/2      // 計算中點索引 m
		if nums[m] < target { // 此時 target 若存在，必在區間 [m+1, j] 內
			i = m + 1
		} else if nums[m] > target { // 此時 target 若存在，必在區間 [i, m-1] 內
			j = m - 1
		} else { // 找到目標元素，回傳其索引
			return m
		}
	}
	// 找不到目標元素，回傳 -1
	return -1
}

/* 二分搜尋（左閉右開區間） */
func binarySearchLCRO(nums []int, target int) int {
	// 將左閉右開區間設為 [0, n)，i 指向陣列的首元素，j 指向末元素的下一個位置
	i, j := 0, len(nums)
	// 當搜尋區間為空（i = j）時，結束迴圈
	for i < j {
		m := i + (j-i)/2      // 計算中點索引 m
		if nums[m] < target { // 此時 target 若存在，必在區間 [m+1, j) 內
			i = m + 1
		} else if nums[m] > target { // 此時 target 若存在，必在區間 [i, m) 內
			j = m
		} else { // 找到目標元素，回傳其索引
			return m
		}
	}
	// 找不到目標元素，回傳 -1
	return -1
}
