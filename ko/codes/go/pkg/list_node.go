// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode: 연결 리스트 노드
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode: 연결 리스트 노드 생성자
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList: 배열을 역직렬화하여 연결 리스트로 만든다
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
