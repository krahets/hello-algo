// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// 快速排序
type quickSort struct{}

// 快速排序（中位基準數最佳化）
type quickSortMedian struct{}

// 快速排序（尾遞迴最佳化）
type quickSortTailCall struct{}

/* 哨兵劃分 */
func (q *quickSort) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準數
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 從右向左找首個小於基準數的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 從左向右找首個大於基準數的元素
		}
		// 元素交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 將基準數交換至兩子陣列的分界線
	nums[i], nums[left] = nums[left], nums[i]
	return i // 返回基準數的索引
}

/* 快速排序 */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止遞迴
	if left >= right {
		return
	}
	// 哨兵劃分
	pivot := q.partition(nums, left, right)
	// 遞迴左子陣列、右子陣列
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 選取三個候選元素的中位數 */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m 在 l 和 r 之間
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l 在 m 和 r 之間
	}
	return right
}

/* 哨兵劃分（三數取中值）*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準數
	med := q.medianThree(nums, left, (left+right)/2, right)
	// 將中位數交換至陣列最左端
	nums[left], nums[med] = nums[med], nums[left]
	// 以 nums[left] 為基準數
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //從右向左找首個小於基準數的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ //從左向右找首個大於基準數的元素
		}
		//元素交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	//將基準數交換至兩子陣列的分界線
	nums[i], nums[left] = nums[left], nums[i]
	return i //返回基準數的索引
}

/* 快速排序 */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止遞迴
	if left >= right {
		return
	}
	// 哨兵劃分
	pivot := q.partition(nums, left, right)
	// 遞迴左子陣列、右子陣列
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* 哨兵劃分 */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// 以 nums[left] 為基準數
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // 從右向左找首個小於基準數的元素
		}
		for i < j && nums[i] <= nums[left] {
			i++ // 從左向右找首個大於基準數的元素
		}
		// 元素交換
		nums[i], nums[j] = nums[j], nums[i]
	}
	// 將基準數交換至兩子陣列的分界線
	nums[i], nums[left] = nums[left], nums[i]
	return i // 返回基準數的索引
}

/* 快速排序（尾遞迴最佳化）*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// 子陣列長度為 1 時終止
	for left < right {
		// 哨兵劃分操作
		pivot := q.partition(nums, left, right)
		// 對兩個子陣列中較短的那個執行快速排序
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // 遞迴排序左子陣列
			left = pivot + 1                 // 剩餘未排序區間為 [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // 遞迴排序右子陣列
			right = pivot - 1                 // 剩餘未排序區間為 [left, pivot - 1]
		}
	}
}
