// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Merge the left and right subarrays */
func merge(nums []int, left, mid, right int) {
	// The left subarray spans [left, mid], and the right subarray spans [mid+1, right]
	// Create a temporary array tmp to store the merged result
	tmp := make([]int, right-left+1)
	// Initialize the starting indices of the left and right subarrays
	i, j, k := left, mid+1, 0
	// While both subarrays have elements remaining, compare them and copy the smaller element into the temporary array
	for i <= mid && j <= right {
		if nums[i] <= nums[j] {
			tmp[k] = nums[i]
			i++
		} else {
			tmp[k] = nums[j]
			j++
		}
		k++
	}
	// Copy the remaining elements of the left and right subarrays into the temporary array
	for i <= mid {
		tmp[k] = nums[i]
		i++
		k++
	}
	for j <= right {
		tmp[k] = nums[j]
		j++
		k++
	}
	// Copy the elements of temporary array tmp back into the corresponding range of the original array nums
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* Merge sort */
func mergeSort(nums []int, left, right int) {
	// Base case
	if left >= right {
		return
	}
	// Divide phase
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// Merge phase
	merge(nums, left, mid, right)
}
