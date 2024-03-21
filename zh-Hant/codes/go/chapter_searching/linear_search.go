// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 线性查找（数组） */
func linearSearchArray(nums []int, target int) int {
	// 遍历数组
	for i := 0; i < len(nums); i++ {
		// 找到目标元素，返回其索引
		if nums[i] == target {
			return i
		}
	}
	// 未找到目标元素，返回 -1
	return -1
}

/* 线性查找（链表） */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 遍历链表
	for node != nil {
		// 找到目标节点，返回之
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 未找到目标元素，返回 nil
	return nil
}
