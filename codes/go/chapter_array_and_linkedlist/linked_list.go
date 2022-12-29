// File: linked_list.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"strconv"
	"strings"
)

/* 链表结点结构体 */
type ListNode struct {
	Val  int       // 结点值
	Next *ListNode // 指向下一结点的指针（引用）
}

// NewListNode 构造函数，创建一个新的链表
func NewListNode(val int) *ListNode {
	return &ListNode{
		Val:  val,
		Next: nil,
	}
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

/* 在链表的结点 n0 之后插入结点 P */
func insertNode(n0 *ListNode, P *ListNode) {
	n1 := n0.Next
	n0.Next = P
	P.Next = n1
}

/* 删除链表的结点 n0 之后的首个结点 */
func removeNode(n0 *ListNode) {
	if n0.Next == nil {
		return
	}
	// n0 -> P -> n1
	P := n0.Next
	n1 := P.Next
	n0.Next = n1
}

/* 访问链表中索引为 index 的结点 */
func access(head *ListNode, index int) *ListNode {
	for i := 0; i < index; i++ {
		head = head.Next
		if head == nil {
			return nil
		}
	}
	return head
}

/* 在链表中查找值为 target 的首个结点 */
func findNode(head *ListNode, target int) int {
	index := 0
	for head != nil {
		if head.Val == target {
			return index
		}
		head = head.Next
		index++
	}
	return -1
}

/* 双向链表结点结构体 */
type DoublyListNode struct {
	Val  int             // 结点值
	Next *DoublyListNode // 指向后继结点的指针（引用）
	Prev *DoublyListNode // 指向前驱结点的指针（引用）
}

// NewDoublyListNode 初始化
func NewDoublyListNode(val int, nodes ...*DoublyListNode) *DoublyListNode {
	var next, prev *DoublyListNode
	length := len(nodes)
	if length > 0 {
		next = nodes[0]
	}
	if length > 1 {
		prev = nodes[1]
	}
	return &DoublyListNode{
		Val:  val,
		Next: next,
		Prev: prev,
	}
}
