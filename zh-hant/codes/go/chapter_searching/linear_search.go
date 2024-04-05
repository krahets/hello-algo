// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 線性查詢（陣列） */
func linearSearchArray(nums []int, target int) int {
	// 走訪陣列
	for i := 0; i < len(nums); i++ {
		// 找到目標元素，返回其索引
		if nums[i] == target {
			return i
		}
	}
	// 未找到目標元素，返回 -1
	return -1
}

/* 線性查詢（鏈結串列） */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 走訪鏈結串列
	for node != nil {
		// 找到目標節點，返回之
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 未找到目標元素，返回 nil
	return nil
}
