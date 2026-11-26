// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 合併左、右子陣列 */
func merge(nums []int, left, mid, right int) {
	// 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
	// 建立暫存陣列 tmp，用來存放合併結果
	tmp := make([]int, right-left+1)
	// 設定左、右子陣列的起始索引
	i, j, k := left, mid+1, 0
	// 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
	// 將左、右子陣列中剩餘的元素複製到暫存陣列
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
	// 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
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
	// 分割階段
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// 合併階段
	merge(nums, left, mid, right)
}
