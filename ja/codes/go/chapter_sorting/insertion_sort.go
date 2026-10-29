// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 挿入ソート */
func insertionSort(nums []int) {
	// 外側のループ：ソート済み区間は [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // nums[j] を右に 1 つずらす
			j--
		}
		nums[j+1] = base // 正しい位置に base を代入する
	}
}
