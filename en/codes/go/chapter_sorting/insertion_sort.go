// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Insertion sort */
func insertionSort(nums []int) {
	// Outer loop: the sorted range is [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// Inner loop: insert base at the correct position in the sorted range [0, i-1]
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // Shift nums[j] one position to the right
			j--
		}
		nums[j+1] = base // Place base at the correct position
	}
}
