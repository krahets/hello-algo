// File: linked_list_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinkedList(t *testing.T) {
	/* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
	// 初始化各个节点
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// 构建节点之间的引用
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("初始化的链表为")
	PrintLinkedList(n0)

	/* 插入节点 */
	insertNode(n0, NewListNode(0))
	fmt.Println("插入节点后的链表为")
	PrintLinkedList(n0)

	/* 删除节点 */
	removeItem(n0)
	fmt.Println("删除节点后的链表为")
	PrintLinkedList(n0)

	/* 访问节点 */
	node := access(n0, 3)
	fmt.Println("链表中索引 3 处的节点的值 =", node)

	/* 查找节点 */
	index := findNode(n0, 2)
	fmt.Println("链表中值为 2 的节点的索引 =", index)
}
