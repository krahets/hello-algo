// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分查找最左一个 target */
func binarySearchLeftEdge(nums []int, target int) int {
	// 等价于查找 target 的插入点
	i := binarySearchInsertion(nums, target)
	// 未找到 target ，返回 -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// 找到 target ，返回索引 i
	return i
}

/* 二分查找最右一个 target */
func binarySearchRightEdge(nums []int, target int) int {
	// 转化为查找最左一个 target + 1
	i := binarySearchInsertion(nums, target+1)
	// j 指向最右一个 target ，i 指向首个大于 target 的元素
	j := i - 1
	// 未找到 target ，返回 -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// 找到 target ，返回索引 j
	return j
}
