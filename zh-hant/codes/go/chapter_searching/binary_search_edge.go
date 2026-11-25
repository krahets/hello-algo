// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 用二分搜尋找最左邊的 target */
func binarySearchLeftEdge(nums []int, target int) int {
	// 等同於搜尋 target 的插入點
	i := binarySearchInsertion(nums, target)
	// 找不到 target，回傳 -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// 找到 target，回傳索引 i
	return i
}

/* 用二分搜尋找最右邊的 target */
func binarySearchRightEdge(nums []int, target int) int {
	// 改為搜尋 target + 1 的最左插入位置
	i := binarySearchInsertion(nums, target+1)
	// j 指向最右邊的 target，i 指向第一個大於 target 的元素
	j := i - 1
	// 找不到 target，回傳 -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// 找到 target，回傳索引 j
	return j
}
