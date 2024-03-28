// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* 泡沫排序 */
func bubbleSort(nums []int) {
	// 外迴圈：未排序區間為 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交換 nums[j] 與 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* 泡沫排序（標誌最佳化）*/
func bubbleSortWithFlag(nums []int) {
	// 外迴圈：未排序區間為 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // 初始化標誌位
		// 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交換 nums[j] 與 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 記錄交換元素
			}
		}
		if flag == false { // 此輪“冒泡”未交換任何元素，直接跳出
			break
		}
	}
}
