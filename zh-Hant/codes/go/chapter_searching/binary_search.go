// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分查找（双闭区间） */
func binarySearch(nums []int, target int) int {
	// 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
	i, j := 0, len(nums)-1
	// 循环，当搜索区间为空时跳出（当 i > j 时为空）
	for i <= j {
		m := i + (j-i)/2      // 计算中点索引 m
		if nums[m] < target { // 此情况说明 target 在区间 [m+1, j] 中
			i = m + 1
		} else if nums[m] > target { // 此情况说明 target 在区间 [i, m-1] 中
			j = m - 1
		} else { // 找到目标元素，返回其索引
			return m
		}
	}
	// 未找到目标元素，返回 -1
	return -1
}

/* 二分查找（左闭右开区间） */
func binarySearchLCRO(nums []int, target int) int {
	// 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
	i, j := 0, len(nums)
	// 循环，当搜索区间为空时跳出（当 i = j 时为空）
	for i < j {
		m := i + (j-i)/2      // 计算中点索引 m
		if nums[m] < target { // 此情况说明 target 在区间 [m+1, j) 中
			i = m + 1
		} else if nums[m] > target { // 此情况说明 target 在区间 [i, m) 中
			j = m
		} else { // 找到目标元素，返回其索引
			return m
		}
	}
	// 未找到目标元素，返回 -1
	return -1
}
