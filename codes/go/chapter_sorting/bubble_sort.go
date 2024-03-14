// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* 冒泡排序 */
func bubbleSort(nums []int) {
	// 外循环：未排序区间为 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交换 nums[j] 与 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* 冒泡排序（标志优化）*/
func bubbleSortWithFlag(nums []int) {
	// 外循环：未排序区间为 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // 初始化标志位
		// 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// 交换 nums[j] 与 nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 记录交换元素
			}
		}
		if flag == false { // 此轮“冒泡”未交换任何元素，直接跳出
			break
		}
	}
}
