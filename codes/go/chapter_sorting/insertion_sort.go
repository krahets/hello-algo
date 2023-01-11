// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

func insertionSort(nums []int) {
	// 外循环：待排序元素数量为 n-1, n-2, ..., 1
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// 内循环：将 base 插入到左边的正确位置
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // 1. 将 nums[j] 向右移动一位
			j--
		}
		nums[j+1] = base // 2. 将 base 赋值到正确位置
	}
}
