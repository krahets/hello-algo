// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Merge the left and right subarrays */
func merge(nums []int, left, mid, right int) {
	// The left subarray spans [left, mid] and the right spans [mid+1, right]
	// Create a temporary array tmp for the merged result
	tmp := make([]int, right-left+1)
	// Initialize the starting indices of the left and right subarrays
	i, j, k := left, mid+1, 0
	// While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
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
	// Copy any remaining elements from either subarray to the temporary array
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
	// Copy tmp back into the corresponding range of nums
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
	// Divide
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// Merge
	merge(nums, left, mid, right)
}
