// File: binary_tree_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
	"testing"
)

func TestBinaryTree(t *testing.T) {
	/* 初始化二叉树 */
	// 初始化结点
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)

	tree := NewBinaryTree(n1)
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	t.Log("初始化二叉树")
	tree.Print()

	/* 插入与删除结点 */
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	t.Log("插入结点 P 后")
	tree.Print()

	// 删除结点
	n1.Left = n2
	t.Log("删除结点 P 后")
	tree.Print()
}
