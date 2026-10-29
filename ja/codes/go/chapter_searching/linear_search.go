// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 線形探索（配列） */
func linearSearchArray(nums []int, target int) int {
	// 配列を走査する
	for i := 0; i < len(nums); i++ {
		// 目的の要素が見つかったので、そのインデックスを返す
		if nums[i] == target {
			return i
		}
	}
	// 目的の要素が見つからなかったので、-1 を返す
	return -1
}

/* 線形探索（連結リスト） */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 連結リストを走査する
	for node != nil {
		// 目的のノードが見つかったので、それを返す
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 目的の要素が見つからなかったので、nil を返す
	return nil
}
