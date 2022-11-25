// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"fmt"
	"strconv"
	"strings"
)

// ListNode Definition for a singly-linked list node
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode Generate a list node with an val
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedListLinkedList Generate a linked list with an array
func ArrayToLinkedListLinkedList(arr []int) *ListNode {
	// dummy header of linked list
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}

// GetListNode Get a list node with specific value from a linked list
func GetListNode(node *ListNode, val int) *ListNode {
	for node != nil && node.Val != val {
		node = node.Next
	}
	return node
}

// PrintLinkedList Print a linked list
func PrintLinkedList(node *ListNode) {
	if node == nil {
		return
	}
	var builder strings.Builder
	for node.Next != nil {
		builder.WriteString(strconv.Itoa(node.Val) + " -> ")
		node = node.Next
	}
	builder.WriteString(strconv.Itoa(node.Val))
	fmt.Println(builder.String())
}
