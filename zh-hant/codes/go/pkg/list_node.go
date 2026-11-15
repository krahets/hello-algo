// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode 鏈結串列節點
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode 鏈結串列節點建構子
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList 將陣列反序列化為鏈結串列
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
