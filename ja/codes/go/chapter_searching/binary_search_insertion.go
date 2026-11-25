// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 挿入位置の二分探索（重複する要素がない場合） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 閉区間 [0, n-1] で初期化する
	i, j := 0, len(nums)-1
	for i <= j {
		// 中央のインデックス m を求める
		m := i + (j-i)/2
		if nums[m] < target {
			// target の探索範囲は [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// target の探索範囲は [i, m-1]
			j = m - 1
		} else {
			// target が見つかったので挿入位置 m を返す
			return m
		}
	}
	// target が見つからなかったので挿入位置 i を返す
	return i
}

/* 挿入位置の二分探索（重複する要素がある場合） */
func binarySearchInsertion(nums []int, target int) int {
	// 閉区間 [0, n-1] で初期化する
	i, j := 0, len(nums)-1
	for i <= j {
		// 中央のインデックス m を求める
		m := i + (j-i)/2
		if nums[m] < target {
			// target の探索範囲は [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// target の探索範囲は [i, m-1]
			j = m - 1
		} else {
			// target 未満の最も右の要素を [i, m-1] で探す
			j = m - 1
		}
	}
	// 挿入位置 i を返す
	return i
}
