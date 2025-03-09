// File: list_node_reverse.go
// Created Time: 2024-01-25
// Author: zkw (jonesashbur@gmail.com)
package chapter_array_and_linkedlist

import . "github.com/krahets/hello-algo/pkg"

/* 反转链表 */
func reverseList(head *ListNode) *ListNode {
	// 初始化前驱节点为 nil
	var prev *ListNode = nil
	curr := head
	// 循环遍历链表
	for curr != nil {
		// 暂存后继节点
		temp := curr.Next
		// 更改当前节点指向
		curr.Next = prev
		// 更新前驱节点
		prev = curr
		// 更新当前节点
		curr = temp
	}
	return prev
}
