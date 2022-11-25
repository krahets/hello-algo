// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

// linerSearchArray 线性查找（数组）
func linerSearchArray(nums []int, target int) int {
	// 遍历数组
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			// 找到目标元素，返回其索引
			return i
		}
	}
	// 未找到目标元素，返回 -1
	return -1
}

// linerSearchLinkedList 线性查找（链表）
func linerSearchLinkedList(node *ListNode, target int) *ListNode {
	// 遍历链表
	for node != nil {
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 未找到目标元素，返回 nil
	return nil
}
