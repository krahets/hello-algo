// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 循序搜尋（陣列） */
func linearSearchArray(nums []int, target int) int {
	// 走訪陣列
	for i := 0; i < len(nums); i++ {
		// 找到目標元素，回傳其索引
		if nums[i] == target {
			return i
		}
	}
	// 找不到目標元素，回傳 -1
	return -1
}

/* 循序搜尋（鏈結串列） */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 走訪鏈結串列
	for node != nil {
		// 找到目標節點，回傳該節點
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 找不到目標元素，回傳 nil
	return nil
}
