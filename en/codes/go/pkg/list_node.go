// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// [region]{list_node}
// ListNode represents a linked list node.
type ListNode struct {
	Val  int       // Node value
	Next *ListNode // Pointer to the next node
}

// NewListNode constructs a linked list node.
func NewListNode(v int) *ListNode {
	return &ListNode{
		Val:  v,
		Next: nil,
	}
}

// [endregion]{list_node}

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
