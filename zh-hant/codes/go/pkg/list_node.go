// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode 代表鏈結串列的節點
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode 用來建立鏈結串列節點
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList 將切片反序列化為鏈結串列
func ArrayToLinkedList(arr []int) *ListNode {
	// 鏈結串列的虛擬頭節點
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
