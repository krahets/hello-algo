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
	// 各ノードを初期化
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// ノード間の参照を構築する
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("初期化した連結リストは")
	PrintLinkedList(n0)

	/* ノードを挿入 */
	insertNode(n0, NewListNode(0))
	fmt.Println("ノード挿入後の連結リストは")
	PrintLinkedList(n0)

	/* ノードを削除 */
	removeItem(n0)
	fmt.Println("ノード削除後の連結リストは")
	PrintLinkedList(n0)

	/* ノードにアクセス */
	node := access(n0, 3)
	fmt.Println("連結リスト内のインデックス 3 のノードの値 =", node)

	/* ノードを探索 */
	index := findNode(n0, 2)
	fmt.Println("連結リスト内で値が 2 のノードのインデックス =", index)
}
