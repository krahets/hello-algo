// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* 二分探索：問題 f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// 区間が空なら対象要素は存在しないため、-1 を返す
	if i > j {
		return -1
	}
	// 中点インデックスを計算する
	m := i + ((j - i) >> 1)
	// 中点の要素と目標要素の大小を判定する
	if nums[m] < target {
		// 小さければ右半分の配列を再帰
		// 部分問題 f(m+1, j) を解く
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// 大きければ左半分の配列を再帰
		// 部分問題 f(i, m-1) を解く
		return dfs(nums, target, i, m-1)
	} else {
		// 目標要素が見つかったらそのインデックスを返す
		return m
	}
}

/* 二分探索 */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
