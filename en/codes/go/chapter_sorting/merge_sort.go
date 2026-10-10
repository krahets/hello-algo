// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Merge left subarray and right subarray */
func merge(nums []int, left, mid, right int) {
	// Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
	// Create a temporary array tmp to store the merged results
	tmp := make([]int, right-left+1)
	// Initialize the start indices of the left and right subarrays
	i, j, k := left, mid+1, 0
	// While both subarrays still have elements, compare and copy the smaller element into the temporary array
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
	// Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* Merge sort */
func mergeSort(nums []int, left, right int) {
	// Termination condition
	if left >= right {
		return
	}
	// Divide and conquer stage
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// Merge stage
	merge(nums, left, mid, right)
}
