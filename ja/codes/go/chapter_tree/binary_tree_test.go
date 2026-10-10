// File: binary_tree_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestBinaryTree(t *testing.T) {
	/* 二分木を初期化 */
	// ノードを初期化
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// ノード間の参照（ポインタ）を構築する
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("二分木を初期化")
	PrintTree(n1)

	/* ノードの挿入と削除 */
	// ノードを挿入
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("ノード P を挿入後")
	PrintTree(n1)
	// ノードを削除
	n1.Left = n2
	fmt.Println("ノード P を削除後")
	PrintTree(n1)
}
