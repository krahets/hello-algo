// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分查找插入点（无重复元素） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 初始化双闭区间 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 计算中点索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 在区间 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target {
			// target 在区间 [i, m-1] 中
			j = m - 1
		} else {
			// 找到 target ，返回插入点 m
			return m
		}
	}
	// 未找到 target ，返回插入点 i
	return i
}

/* 二分查找插入点（存在重复元素） */
func binarySearchInsertion(nums []int, target int) int {
	// 初始化双闭区间 [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// 计算中点索引 m
		m := i + (j-i)/2
		if nums[m] < target {
			// target 在区间 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target {
			// target 在区间 [i, m-1] 中
			j = m - 1
		} else {
			// 首个小于 target 的元素在区间 [i, m-1] 中
			j = m - 1
		}
	}
	// 返回插入点 i
	return i
}
