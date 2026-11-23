// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分探索による挿入位置の探索（重複要素がない場合） */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 閉区間 [0, n-1] を初期化する
	i, j := 0, len(nums)-1
	for i <= j {
		// 中央のインデックス m を計算する
		m := i + (j-i)/2
		if nums[m] < target {
			// target は区間 [m+1, j] に存在する
			i = m + 1
		} else if nums[m] > target {
			// target は区間 [i, m-1] に存在する
			j = m - 1
		} else {
			// target が見つかったので、挿入位置 m を返す
			return m
		}
	}
	// target が見つからなかったので、挿入位置 i を返す
	return i
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
func binarySearchInsertion(nums []int, target int) int {
	// 閉区間 [0, n-1] を初期化する
	i, j := 0, len(nums)-1
	for i <= j {
		// 中央のインデックス m を計算する
		m := i + (j-i)/2
		if nums[m] < target {
			// target は区間 [m+1, j] に存在する
			i = m + 1
		} else if nums[m] > target {
			// target は区間 [i, m-1] に存在する
			j = m - 1
		} else {
			// target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
			j = m - 1
		}
	}
	// 挿入位置 i を返す
	return i
}
