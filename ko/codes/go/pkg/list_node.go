// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode는 연결 리스트의 노드다.
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode는 연결 리스트 노드의 생성자다.
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList는 배열을 연결 리스트로 역직렬화한다.
func ArrayToLinkedList(arr []int) *ListNode {
	// 연결 리스트의 더미 머리 노드
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
