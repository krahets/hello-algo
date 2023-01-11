// File: linked_list_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
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
	fmt.Println("初始化的链表为")
	PrintLinkedList(n0)

	/* 插入结点 */
	insertNode(n0, NewListNode(0))
	fmt.Println("插入结点后的链表为")
	PrintLinkedList(n0)

	/* 删除结点 */
	removeNode(n0)
	fmt.Println("删除结点后的链表为")
	PrintLinkedList(n0)

	/* 访问结点 */
	node := access(n0, 3)
	fmt.Println("链表中索引 3 处的结点的值 =", node)

	/* 查找结点 */
	index := findNode(n0, 2)
	fmt.Println("链表中值为 2 的结点的索引 =", index)
}
