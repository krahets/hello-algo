// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode は連結リストノード
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode は連結リストノードのコンストラクタ
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList は配列を連結リストにデシリアライズする
func ArrayToLinkedList(arr []int) *ListNode {
	// dummy header of linked list
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
