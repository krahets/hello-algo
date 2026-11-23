// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// Quick sort
type quickSort struct{}

// Quick sort (median pivot optimization)
type quickSortMedian struct{}

// Quick sort (recursion depth optimization)
type quickSortTailCall struct{}

/* Two-pointer partitioning */
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
		// Swap the elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot into the boundary position between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the pivot index
}

/* Quick sort */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// Stop recursing when the subarray has at most one element
	if left >= right {
		return
	}
	// Two-pointer partitioning
	pivot := q.partition(nums, left, right)
	// Recurse on the left and right subarrays
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Select the median of three candidate elements */
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

/* Two-pointer partitioning (median of three)*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// Select the median of the left, middle, and right elements as the pivot
	med := q.medianThree(nums, left, (left+right)/2, right)
	// Swap the median into the leftmost position of the current subarray
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
		//Swap the elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	//Swap the pivot into the boundary position between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i //Return the pivot index
}

/* Quick sort */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// Stop recursing when the subarray has at most one element
	if left >= right {
		return
	}
	// Two-pointer partitioning
	pivot := q.partition(nums, left, right)
	// Recurse on the left and right subarrays
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Two-pointer partitioning */
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
		// Swap the elements
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Swap the pivot into the boundary position between the two subarrays
	nums[i], nums[left] = nums[left], nums[i]
	return i // Return the pivot index
}

/* Quick sort (recursion depth optimization)*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// Stop when the subarray has at most one element
	for left < right {
		// Perform two-pointer partitioning
		pivot := q.partition(nums, left, right)
		// Apply quick sort to the shorter of the two subarrays
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // Recursively sort the left subarray
			left = pivot + 1                 // The remaining unsorted range is [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // Recursively sort the right subarray
			right = pivot - 1                 // The remaining unsorted range is [left, pivot - 1]
		}
	}
}
