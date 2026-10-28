// File: linked_list.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
func insertNode(n0 *ListNode, P *ListNode) {
	n1 := n0.Next
	P.Next = n1
	n0.Next = P
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
func removeItem(n0 *ListNode) {
	if n0.Next == nil {
		return
	}
	// n0 -> P -> n1
	P := n0.Next
	n1 := P.Next
	n0.Next = n1
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
func access(head *ListNode, index int) *ListNode {
	for i := 0; i < index; i++ {
		if head == nil {
			return nil
		}
		head = head.Next
	}
	return head
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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
