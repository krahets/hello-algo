// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 合併左子陣列和右子陣列 */
func merge(nums []int, left, mid, right int) {
	// 左子陣列區間為 [left, mid], 右子陣列區間為 [mid+1, right]
	// 建立一個臨時陣列 tmp ，用於存放合併後的結果
	tmp := make([]int, right-left+1)
	// 初始化左子陣列和右子陣列的起始索引
	i, j, k := left, mid+1, 0
	// 當左右子陣列都還有元素時，進行比較並將較小的元素複製到臨時陣列中
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
	// 將左子陣列和右子陣列的剩餘元素複製到臨時陣列中
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
	// 將臨時陣列 tmp 中的元素複製回原陣列 nums 的對應區間
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* 合併排序 */
func mergeSort(nums []int, left, right int) {
	// 終止條件
	if left >= right {
		return
	}
	// 劃分階段
	mid := (left + right) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// 合併階段
	merge(nums, left, mid, right)
}
