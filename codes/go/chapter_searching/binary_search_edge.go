// File: binary_search_edge.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分查找最左一个元素 */
func binarySearchLeftEdge(nums []int, target int) int {
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
	if i == len(nums) || nums[i] != target {
		// 未找到目标元素，返回 -1
		return -1
	}
	return i
}

/* 二分查找最右一个元素 */
func binarySearchRightEdge(nums []int, target int) int {
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
			// 首个大于 target 的元素在区间 [m+1, j] 中
			i = m + 1
		}
	}
	if j < 0 || nums[j] != target {
		// 未找到目标元素，返回 -1
		return -1
	}
	return j
}
