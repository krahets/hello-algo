// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 最も左の target を二分探索 */
func binarySearchLeftEdge(nums []int, target int) int {
	// target の挿入位置を探すのと等価
	i := binarySearchInsertion(nums, target)
	// target が見つからなければ、-1 を返す
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// target が見つかったら、インデックス i を返す
	return i
}

/* 最も右の target を二分探索 */
func binarySearchRightEdge(nums []int, target int) int {
	// 最左の target + 1 を探す問題に変換する
	i := binarySearchInsertion(nums, target+1)
	// j は最も右の target を指し、i は target より大きい最初の要素を指す
	j := i - 1
	// target が見つからなければ、-1 を返す
	if j == -1 || nums[j] != target {
		return -1
	}
	// target が見つかったら、インデックス j を返す
	return j
}
