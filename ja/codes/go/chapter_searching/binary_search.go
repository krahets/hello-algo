// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分探索（閉区間） */
func binarySearch(nums []int, target int) int {
	// 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
	i, j := 0, len(nums)-1
	// 探索区間が空になるまで繰り返す（i > j のとき空になる）
	for i <= j {
		m := i + (j-i)/2      // 中央のインデックス m を計算する
		if nums[m] < target { // この場合、target は区間 [m+1, j] に存在する
			i = m + 1
		} else if nums[m] > target { // この場合、target は区間 [i, m-1] に存在する
			j = m - 1
		} else { // 目的の要素が見つかったので、そのインデックスを返す
			return m
		}
	}
	// 目的の要素が見つからなかったので、-1 を返す
	return -1
}

/* 二分探索（左閉右開区間） */
func binarySearchLCRO(nums []int, target int) int {
	// 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
	i, j := 0, len(nums)
	// 探索区間が空になるまで繰り返す（i = j のとき空になる）
	for i < j {
		m := i + (j-i)/2      // 中央のインデックス m を計算する
		if nums[m] < target { // この場合、target は区間 [m+1, j) に存在する
			i = m + 1
		} else if nums[m] > target { // この場合、target は区間 [i, m) に存在する
			j = m
		} else { // 目的の要素が見つかったので、そのインデックスを返す
			return m
		}
	}
	// 目的の要素が見つからなかったので、-1 を返す
	return -1
}
