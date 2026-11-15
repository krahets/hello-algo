// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// [region]{list_node}
// ListNode 链表节点
type ListNode struct {
	Val  int       // 节点值
	Next *ListNode // 后继节点指针
}

// NewListNode 链表节点构造函数
func NewListNode(v int) *ListNode {
	return &ListNode{
		Val:  v,
		Next: nil,
	}
}

// [endregion]{list_node}

// ArrayToLinkedList 将数组反序列化为链表
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
