// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* 二分探索：問題 f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// 区間が空なら目的の要素はないので -1 を返す
	if i > j {
		return -1
	}
	//	中央のインデックスを求める
	m := i + ((j - i) >> 1)
	//中央の要素と目的の要素の大小を比べる
	if nums[m] < target {
		// 中央の要素が小さければ右半分を再帰的に探索する
		// 部分問題 f(m+1, j) を再帰的に解く
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// 中央の要素が大きければ左半分を再帰的に探索する
		// 部分問題 f(i, m-1) を再帰的に解く
		return dfs(nums, target, i, m-1)
	} else {
		// 目的の要素が見つかったので、そのインデックスを返す
		return m
	}
}

/* 二分探索 */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
