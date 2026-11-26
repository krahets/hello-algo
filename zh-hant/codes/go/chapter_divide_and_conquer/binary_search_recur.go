// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* 二分搜尋：問題 f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// 若區間為空，表示沒有目標元素，回傳 -1
	if i > j {
		return -1
	}
	//	計算中點索引
	m := i + ((j - i) >> 1)
	//比較中點元素與目標元素的大小
	if nums[m] < target {
		// 若中點元素較小，遞迴搜尋右半部陣列
		// 遞迴求解子問題 f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// 若中點元素較大，遞迴搜尋左半部陣列
		// 遞迴求解子問題 f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// 找到目標元素，回傳其索引
		return m
	}
}

/* 二分搜尋 */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
