// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 二分探索（両閉区間） */
func binarySearch(nums []int, target int) int {
	// 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
	i, j := 0, len(nums)-1
	// ループし、探索区間が空になったら終了する（i > j で空）
	for i <= j {
		m := i + (j-i)/2      // 中点インデックス m を計算
		if nums[m] < target { // この場合、target は区間 [m+1, j] にある
			i = m + 1
		} else if nums[m] > target { // この場合、target は区間 [i, m-1] にある
			j = m - 1
		} else { // 目標要素が見つかったらそのインデックスを返す
			return m
		}
	}
	// 目標要素が見つからなければ -1 を返す
	return -1
}

/* 二分探索（左閉右開区間） */
func binarySearchLCRO(nums []int, target int) int {
	// 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
	i, j := 0, len(nums)
	// ループし、探索区間が空になったら終了する（i = j で空）
	for i < j {
		m := i + (j-i)/2      // 中点インデックス m を計算
		if nums[m] < target { // この場合、target は区間 [m+1, j) にある
			i = m + 1
		} else if nums[m] > target { // この場合、target は区間 [i, m) にある
			j = m
		} else { // 目標要素が見つかったらそのインデックスを返す
			return m
		}
	}
	// 目標要素が見つからなければ -1 を返す
	return -1
}
