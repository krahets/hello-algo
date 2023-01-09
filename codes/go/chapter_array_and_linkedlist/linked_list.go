// File: linked_list.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 在链表的结点 n0 之后插入结点 P */
func insertNode(n0 *ListNode, P *ListNode) {
	n1 := n0.Next
	n0.Next = P
	P.Next = n1
}

/* 删除链表的结点 n0 之后的首个结点 */
func removeNode(n0 *ListNode) {
	if n0.Next == nil {
		return
	}
	// n0 -> P -> n1
	P := n0.Next
	n1 := P.Next
	n0.Next = n1
}

/* 访问链表中索引为 index 的结点 */
func access(head *ListNode, index int) *ListNode {
	for i := 0; i < index; i++ {
		if head == nil {
			return nil
		}
		head = head.Next
	}
	return head
}

/* 在链表中查找值为 target 的首个结点 */
func findNode(head *ListNode, target int) int {
	index := 0
	for head != nil {
		if head.Val == target {
			return index
		}
		head = head.Next
		index++
	}
	return -1
}
