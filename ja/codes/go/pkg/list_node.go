// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// [region]{list_node}
// ListNode は連結リストのノード
type ListNode struct {
	Val  int       // ノードの値
	Next *ListNode // 後続ノードへのポインタ
}

// NewListNode は連結リストのノードのコンストラクタ
func NewListNode(v int) *ListNode {
	return &ListNode{
		Val:  v,
		Next: nil,
	}
}

// [endregion]{list_node}

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
