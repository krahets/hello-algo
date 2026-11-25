// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode は連結リストのノードを表す
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode は連結リストのノードを作成する
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList は配列をデシリアライズして連結リストを復元する
func ArrayToLinkedList(arr []int) *ListNode {
	// 連結リストのダミーヘッド
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
