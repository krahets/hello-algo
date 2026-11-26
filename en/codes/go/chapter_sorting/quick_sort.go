// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// Quicksort
type quickSort struct{}

// Quicksort with median-of-three pivot selection
type quickSortMedian struct{}

// Quicksort with reduced recursion depth
type quickSortTailCall struct{}

/* Partition with two pointers */
func (q *quickSort) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Scan from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Scan from left to right for the first element larger than the pivot
		}
		// Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot into place between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the pivot index
}

/* Quicksort */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// Stop recursing when the subarray has length 1
	if left >= right {
		return
	}
	// Partition with two pointers
	pivot := q.partition(nums, left, right)
	// Recurse on the left and right subarrays
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Select the median of three candidates */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m lies between l and r
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l lies between m and r
	}
	return right
}

/* Partition with two pointers (median of three)*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	med := q.medianThree(nums, left, (left+right)/2, right)
	// Swap the median into the leftmost position
	nums[left], nums[med] = nums[med], nums[left]
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //Scan from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ //Scan from left to right for the first element larger than the pivot
		}
		//Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	//Swap the pivot into place between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i //Return the pivot index
}

/* Quicksort */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// Stop recursing when the subarray has length 1
	if left >= right {
		return
	}
	// Partition with two pointers
	pivot := q.partition(nums, left, right)
	// Recurse on the left and right subarrays
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Partition with two pointers */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Scan from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Scan from left to right for the first element larger than the pivot
		}
		// Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot into place between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the pivot index
}

/* Quicksort with reduced recursion depth*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// Stop when the subarray has length 1
	for left < right {
		// Partition with two pointers
		pivot := q.partition(nums, left, right)
		// Apply quicksort to the shorter of the two subarrays
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // Recursively sort the left subarray
			left = pivot + 1                 // The remaining unsorted range is [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // Recursively sort the right subarray
			right = pivot - 1                 // The remaining unsorted range is [left, pivot - 1]
		}
	}
}
