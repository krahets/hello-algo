// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* 氣泡排序 */
func bubbleSort(nums []int) {
	// 外層迴圈：尚未排序的區間為 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交換 nums[j] 與 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* 氣泡排序（以旗標最佳化）*/
func bubbleSortWithFlag(nums []int) {
	// 外層迴圈：尚未排序的區間為 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // 初始化旗標
		// 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交換 nums[j] 與 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 記錄本輪曾交換元素
			}
		}
		if flag == false { // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
			break
		}
	}
}
