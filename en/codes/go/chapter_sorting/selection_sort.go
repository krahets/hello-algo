// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Selection sort */
func selectionSort(nums []int) {
	n := len(nums)
	// Outer loop: unsorted interval is [i, n-1]
	for i := 0; i < n-1; i++ {
		// Inner loop: find the smallest element within the unsorted interval
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// Record the index of the smallest element
				k = j
			}
		}
		// Swap the smallest element with the first element of the unsorted interval
		nums[i], nums[k] = nums[k], nums[i]

	}
}
