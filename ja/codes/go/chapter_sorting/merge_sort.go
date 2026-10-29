// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 左部分配列と右部分配列をマージする */
func merge(nums []int, left, mid, right int) {
	// 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
	// マージ後の結果を格納する一時配列 tmp を作成する
	tmp := make([]int, right-left+1)
	// 左部分配列と右部分配列の開始インデックスを初期化する
	i, j, k := left, mid+1, 0
	// 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
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
	// 左部分配列と右部分配列の残りの要素を一時配列にコピーする
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
	// 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
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
