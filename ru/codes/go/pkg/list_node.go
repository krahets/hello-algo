// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode — узел связного списка
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode создаёт узел связного списка
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList восстанавливает связный список из массива
func ArrayToLinkedList(arr []int) *ListNode {
	// Фиктивный начальный узел связного списка
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
