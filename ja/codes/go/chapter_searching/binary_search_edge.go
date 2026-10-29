// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 二分探索で最も左にある target を探す */
func binarySearchLeftEdge(nums []int, target int) int {
	// target の挿入位置を探すことに等しい
	i := binarySearchInsertion(nums, target)
	// target が見つからなかったので、-1 を返す
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// target が見つかったので、インデックス i を返す
	return i
}

/* 二分探索で最も右にある target を探す */
func binarySearchRightEdge(nums []int, target int) int {
	// 最も左にある target + 1 を探す問題に変換する
	i := binarySearchInsertion(nums, target+1)
	// j は最も右にある target を指し、i は target より大きい最初の要素を指す
	j := i - 1
	// target が見つからなかったので、-1 を返す
	if j == -1 || nums[j] != target {
		return -1
	}
	// target が見つかったので、インデックス j を返す
	return j
}
