// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分探索で挿入位置を探す（重複要素なし） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 両閉区間 [0, n-1] を初期化
	i, j := 0, len(nums)-1
	for i <= j {
		// 中点インデックス m を計算
		m := i + (j-i)/2
		if nums[m] < target {
			// target は区間 [m+1, j] にある
			i = m + 1
		} else if nums[m] > target {
			// target は区間 [i, m-1] にある
			j = m - 1
		} else {
			// target が見つかったら、挿入位置 m を返す
			return m
		}
	}
	// target が見つからなければ、挿入位置 i を返す
	return i
}

/* 二分探索で挿入位置を探す（重複要素あり） */
func binarySearchInsertion(nums []int, target int) int {
	// 両閉区間 [0, n-1] を初期化
	i, j := 0, len(nums)-1
	for i <= j {
		// 中点インデックス m を計算
		m := i + (j-i)/2
		if nums[m] < target {
			// target は区間 [m+1, j] にある
			i = m + 1
		} else if nums[m] > target {
			// target は区間 [i, m-1] にある
			j = m - 1
		} else {
			// target より小さい最初の要素は区間 [i, m-1] にある
			j = m - 1
		}
	}
	// 挿入位置 i を返す
	return i
}
