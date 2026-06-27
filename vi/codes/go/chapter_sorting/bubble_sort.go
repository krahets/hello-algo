// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* Bubble sort */
func bubbleSort(nums []int) {
	// Outer loop: unsorted range is [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Swap nums[j] and nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* Bubble sort (flag optimization) */
func bubbleSortWithFlag(nums []int) {
	// Outer loop: unsorted range is [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // Initialize flag
		// Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Swap nums[j] and nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // Record element swap
			}
		}
		if flag == false { // No elements were swapped in this round of "bubbling", exit directly
			break
		}
	}
}
