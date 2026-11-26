// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 左右の部分配列をマージ */
func merge(nums []int, left, mid, right int) {
	// 左の部分配列は [left, mid]、右の部分配列は [mid+1, right]
	// マージ結果を格納する一時配列 tmp を作成
	tmp := make([]int, right-left+1)
	// 左右の部分配列の開始インデックスを初期化
	i, j, k := left, mid+1, 0
	// 両方の部分配列に要素が残っている間、値を比較し、小さいほうを一時配列にコピー
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
	// 左右の部分配列に残った要素を一時配列にコピー
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
	// 一時配列 tmp の要素を元の配列 nums の対応区間に書き戻す
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* マージソート */
func mergeSort(nums []int, left, right int) {
	// 終了条件
	if left >= right {
		return
	}
	// 分割段階
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// マージ段階
	merge(nums, left, mid, right)
}
