// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// Quick sort
type quickSort struct{}

// Quick sort (recursion depth optimization)
type quickSortMedian struct{}

// Quick sort (recursion depth optimization)
type quickSortTailCall struct{}

/* Sentinel partition */
func (q *quickSort) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Search from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Search from left to right for the first element greater than the pivot
		}
		// Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot to the boundary between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the index of the pivot
}

/* Quick sort */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// Terminate recursion when subarray length is 1
	if left >= right {
		return
	}
	// Sentinel partition
	pivot := q.partition(nums, left, right)
	// Recursively process the left subarray and right subarray
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Select the median of three candidate elements */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m is between l and r
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l is between m and r
	}
	return right
}

/* Sentinel partition (median of three) */
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	med := q.medianThree(nums, left, (left+right)/2, right)
	// Swap the median to the array's leftmost position
	nums[left], nums[med] = nums[med], nums[left]
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Search from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Search from left to right for the first element greater than the pivot
		}
		// Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot to the boundary between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the index of the pivot
}

/* Quick sort */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// Terminate recursion when subarray length is 1
	if left >= right {
		return
	}
	// Sentinel partition
	pivot := q.partition(nums, left, right)
	// Recursively process the left subarray and right subarray
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Sentinel partition */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// Use nums[left] as the pivot
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Search from right to left for the first element smaller than the pivot
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Search from left to right for the first element greater than the pivot
		}
		// Swap elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot to the boundary between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the index of the pivot
}

/* Quick sort (recursion depth optimization) */
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// Terminate when subarray length is 1
	for left < right {
		// Sentinel partition operation
		pivot := q.partition(nums, left, right)
		// Perform quick sort on the shorter of the two subarrays
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // Recursively sort the left subarray
			left = pivot + 1                 // Remaining unsorted interval is [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // Recursively sort the right subarray
			right = pivot - 1                 // Remaining unsorted interval is [left, pivot - 1]
		}
	}
}
