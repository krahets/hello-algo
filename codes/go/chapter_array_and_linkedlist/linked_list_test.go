// File: linked_list_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

func TestLikedList(t *testing.T) {
	/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
	// 初始化各个结点
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// 构建引用指向
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4

	fmt.Println("链表结构：")
	PrintLinkedList(n0)

	P := NewListNode(6)

	/* 在链表的结点 n0 之后插入结点 P */
	insertNode(n0, P)
	fmt.Println("在链表的结点 n0 之后插入结点 P 后，链表结构：")
	PrintLinkedList(n0)

	/* 删除链表的结点 n0 之后的首个结点 */
	removeNode(n0)
	fmt.Println("删除链表的结点 n0 之后的首个结点后，链表结构：")
	PrintLinkedList(n0)

	/* 访问链表中索引为 index 的结点 */
	fmt.Println("访问链表中索引为 2 的结点：", access(n0, 2))

	/* 在链表中查找值为 target 的首个结点 */
	fmt.Println("在链表中查找 5 的首个节点索引值：", findNode(n0, 5))
}
