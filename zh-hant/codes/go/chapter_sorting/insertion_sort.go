// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 插入排序 */
func insertionSort(nums []int) {
	// 外層迴圈：已排序的區間為 [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// 內層迴圈：將 base 插入已排序區間 [0, i-1] 中的正確位置
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // 將 nums[j] 向右移動一格
			j--
		}
		nums[j+1] = base // 將 base 寫入正確位置
	}
}
