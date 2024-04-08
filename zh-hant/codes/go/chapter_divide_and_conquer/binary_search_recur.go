// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* 二分搜尋：問題 f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// 如果區間為空，代表沒有目標元素，則返回 -1
	if i > j {
		return -1
	}
	//	計算索引中點
	m := i + ((j - i) >> 1)
	//判斷中點與目標元素大小
	if nums[m] < target {
		// 小於則遞迴右半陣列
		// 遞迴子問題 f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// 小於則遞迴左半陣列
		// 遞迴子問題 f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// 找到目標元素，返回其索引
		return m
	}
}

/* 二分搜尋 */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
