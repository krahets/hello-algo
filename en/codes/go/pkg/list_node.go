// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode represents a linked list node.
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode constructs a linked list node.
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList deserializes an array into a linked list.
func ArrayToLinkedList(arr []int) *ListNode {
	// Dummy head of the linked list
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
