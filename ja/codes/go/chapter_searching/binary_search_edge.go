// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 最も左にある target の二分探索 */
func binarySearchLeftEdge(nums []int, target int) int {
	// target の挿入位置を探すことと同じ
	i := binarySearchInsertion(nums, target)
	// target が見つからなかったので -1 を返す
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// target が見つかったのでインデックス i を返す
	return i
}

/* 最も右にある target の二分探索 */
func binarySearchRightEdge(nums []int, target int) int {
	// 最も左にある target + 1 の探索に置き換える
	i := binarySearchInsertion(nums, target+1)
	// j は最も右の target を、i は target より大きい最初の要素を指す
	j := i - 1
	// target が見つからなかったので -1 を返す
	if j == -1 || nums[j] != target {
		return -1
	}
	// target が見つかったのでインデックス j を返す
	return j
}
