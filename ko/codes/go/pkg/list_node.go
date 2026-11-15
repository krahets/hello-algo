// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// [region]{list_node}
// ListNode: 연결 리스트 노드
type ListNode struct {
	Val  int       // 노드 값
	Next *ListNode // 다음 노드 포인터
}

// NewListNode: 연결 리스트 노드 생성자
func NewListNode(v int) *ListNode {
	return &ListNode{
		Val:  v,
		Next: nil,
	}
}

// [endregion]{list_node}

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
