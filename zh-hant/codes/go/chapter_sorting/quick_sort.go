// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// 快速排序
type quickSort struct{}

// 快速排序（以中位數作為基準值的最佳化）
type quickSortMedian struct{}

// 快速排序（遞迴深度最佳化）
type quickSortTailCall struct{}

/* 哨兵分割 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準值
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 從右向左尋找第一個小於基準值的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 從左向右尋找第一個大於基準值的元素
		}
		// 交換元素
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 交換元素，將基準值移到兩個子陣列的交界處
	nums[i], nums[left] = nums[left], nums[i]
	return i // 回傳基準值的索引
}

/* 快速排序 */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止遞迴
	if left >= right {
		return
	}
	// 哨兵分割
	pivot := q.partition(nums, left, right)
	// 遞迴處理左、右子陣列
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 取三個候選元素的中位數 */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m 介於 l 和 r 之間
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l 介於 m 和 r 之間
	}
	return right
}

/* 哨兵分割（三數取中）*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準值
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 將中位數與陣列最左端的元素交換
	nums[left], nums[med] = nums[med], nums[left]
	// 以 nums[left] 為基準值
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //從右向左尋找第一個小於基準值的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ //從左向右尋找第一個大於基準值的元素
		}
		//交換元素
		nums[i], nums[j] = nums[j], nums[i]
	}
	//交換元素，將基準值移到兩個子陣列的交界處
	nums[i], nums[left] = nums[left], nums[i]
	return i //回傳基準值的索引
}

/* 快速排序 */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止遞迴
	if left >= right {
		return
	}
	// 哨兵分割
	pivot := q.partition(nums, left, right)
	// 遞迴處理左、右子陣列
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 哨兵分割 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準值
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 從右向左尋找第一個小於基準值的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 從左向右尋找第一個大於基準值的元素
		}
		// 交換元素
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 交換元素，將基準值移到兩個子陣列的交界處
	nums[i], nums[left] = nums[left], nums[i]
	return i // 回傳基準值的索引
}

/* 快速排序（遞迴深度最佳化）*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止
	for left < right {
		// 執行哨兵分割
		pivot := q.partition(nums, left, right)
		// 對兩個子陣列中較短的一個執行快速排序
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 遞迴排序左子陣列
			left = pivot + 1                 // 剩餘的未排序區間為 [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 遞迴排序右子陣列
			right = pivot - 1                 // 剩餘的未排序區間為 [left, pivot - 1]
		}
	}
}
