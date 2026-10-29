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
	/* 連結リスト 1 -> 3 -> 2 -> 5 -> 4 を初期化する */
	// 各ノードを初期化する
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// ノード間の参照を設定する
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("初期化した連結リスト")
	PrintLinkedList(n0)

	/* ノードを挿入する */
	insertNode(n0, NewListNode(0))
	fmt.Println("ノードを挿入した後の連結リスト")
	PrintLinkedList(n0)

	/* ノードを削除する */
	removeItem(n0)
	fmt.Println("ノードを削除した後の連結リスト")
	PrintLinkedList(n0)

	/* ノードにアクセスする */
	node := access(n0, 3)
	fmt.Println("連結リストのインデックス 3 にあるノードの値 =", node)

	/* ノードを探索する */
	index := findNode(n0, 2)
	fmt.Println("連結リスト内で値が 2 であるノードのインデックス =", index)
}
