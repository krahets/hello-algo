// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 線形探索（配列） */
func linearSearchArray(nums []int, target int) int {
	// 配列を走査
	for i := 0; i < len(nums); i++ {
		// 目標要素が見つかったらそのインデックスを返す
		if nums[i] == target {
			return i
		}
	}
	// 目標要素が見つからなければ -1 を返す
	return -1
}

/* 線形探索（連結リスト） */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 連結リストを走査
	for node != nil {
		// 対象ノードが見つかったら、それを返す
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 対象要素が見つからない場合は `nil` を返す
	return nil
}
