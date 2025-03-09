// File: list_node_merge.go
// Created Time: 2024-01-25
// Author: zkw (jonesashbur@gmail.com)
package chapter_array_and_linkedlist

import . "github.com/krahets/hello-algo/pkg"

/* 合并两个有序链表 */
func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
	// 创建虚拟头节点
	dum := &ListNode{}
	prev := dum
	// 循环比较两个链表的节点值
	for l1 != nil && l2 != nil {
		if l1.Val <= l2.Val {
			prev.Next = l1
			l1 = l1.Next
		} else {
			prev.Next = l2
			l2 = l2.Next
		}
		prev = prev.Next
	}
	// 将剩余节点接入合并链表
	if l1 != nil {
		prev.Next = l1
	}
	if l2 != nil {
		prev.Next = l2
	}
	return dum.Next
}