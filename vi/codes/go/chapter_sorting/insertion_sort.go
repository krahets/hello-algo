// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Insertion sort */
func insertionSort(nums []int) {
	// Outer loop: sorted interval is [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// Inner loop: insert base into the correct position within the sorted interval [0, i-1]
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // Move nums[j] to the right by one position
			j--
		}
		nums[j+1] = base // Assign base to the correct position
	}
}
