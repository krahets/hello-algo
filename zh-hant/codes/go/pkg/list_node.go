// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// [region]{list_node}
// ListNode 鏈結串列節點
type ListNode struct {
	Val  int       // 節點值
	Next *ListNode // 後繼節點指標
}

// NewListNode 鏈結串列節點建構子
func NewListNode(v int) *ListNode {
	return &ListNode{
		Val:  v,
		Next: nil,
	}
}

// [endregion]{list_node}

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
