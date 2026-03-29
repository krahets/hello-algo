// File: linked_list.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 連結リストでノード n0 の後ろにノード P を挿入する */
func insertNode(n0 *ListNode, P *ListNode) {
	n1 := n0.Next
	P.Next = n1
	n0.Next = P
}

/* 連結リストでノード n0 の直後のノードを削除する */
func removeItem(n0 *ListNode) {
	if n0.Next == nil {
		return
	}
	// n0 -> P -> n1
	P := n0.Next
	n1 := P.Next
	n0.Next = n1
}

/* 連結リスト内で index 番目のノードにアクセス */
func access(head *ListNode, index int) *ListNode {
	for i := 0; i < index; i++ {
		if head == nil {
			return nil
		}
		head = head.Next
	}
	return head
}

/* 連結リストで値が target の最初のノードを探す */
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
