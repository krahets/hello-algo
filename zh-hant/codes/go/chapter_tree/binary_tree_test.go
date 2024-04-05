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
	/* 初始化二元樹 */
	// 初始化節點
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// 構建節點之間的引用（指標）
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("初始化二元樹")
	PrintTree(n1)

	/* 插入與刪除節點 */
	// 插入節點
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("插入節點 P 後")
	PrintTree(n1)
	// 刪除節點
	n1.Left = n2
	fmt.Println("刪除節點 P 後")
	PrintTree(n1)
}
