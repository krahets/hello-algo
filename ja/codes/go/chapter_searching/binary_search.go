// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分探索（閉区間） */
func binarySearch(nums []int, target int) int {
	// 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
	i, j := 0, len(nums)-1
	// 探索区間が空になるまで繰り返す（i > j のとき空）
	for i <= j {
		m := i + (j-i)/2      // 中央のインデックス m を求める
		if nums[m] < target { // この場合、target の探索範囲は [m+1, j]
			i = m + 1
		} else if nums[m] > target { // この場合、target の探索範囲は [i, m-1]
			j = m - 1
		} else { // 目標の要素が見つかったので、そのインデックスを返す
			return m
		}
	}
	// 目標の要素が見つからなかったので -1 を返す
	return -1
}

/* 二分探索（左閉右開区間） */
func binarySearchLCRO(nums []int, target int) int {
	// 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
	i, j := 0, len(nums)
	// 探索区間が空になるまで繰り返す（i = j のとき空）
	for i < j {
		m := i + (j-i)/2      // 中央のインデックス m を求める
		if nums[m] < target { // この場合、target の探索範囲は [m+1, j)
			i = m + 1
		} else if nums[m] > target { // この場合、target の探索範囲は [i, m)
			j = m
		} else { // 目標の要素が見つかったので、そのインデックスを返す
			return m
		}
	}
	// 目標の要素が見つからなかったので -1 を返す
	return -1
}
