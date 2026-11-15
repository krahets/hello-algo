// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode は連結リストのノード
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode は連結リストのノードのコンストラクタ
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList は配列をデシリアライズして連結リストにする
func ArrayToLinkedList(arr []int) *ListNode {
	// 連結リストのダミーの先頭ノード
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
