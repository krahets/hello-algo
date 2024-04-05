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
	/* 初始化鏈結串列 1 -> 3 -> 2 -> 5 -> 4 */
	// 初始化各個節點
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// 構建節點之間的引用
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("初始化的鏈結串列為")
	PrintLinkedList(n0)

	/* 插入節點 */
	insertNode(n0, NewListNode(0))
	fmt.Println("插入節點後的鏈結串列為")
	PrintLinkedList(n0)

	/* 刪除節點 */
	removeItem(n0)
	fmt.Println("刪除節點後的鏈結串列為")
	PrintLinkedList(n0)

	/* 訪問節點 */
	node := access(n0, 3)
	fmt.Println("鏈結串列中索引 3 處的節點的值 =", node)

	/* 查詢節點 */
	index := findNode(n0, 2)
	fmt.Println("鏈結串列中值為 2 的節點的索引 =", index)
}
