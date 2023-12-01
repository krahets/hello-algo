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
	/* 初始化二叉树 */
	// 初始化节点
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// 构建节点之间的引用（指针）
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("初始化二叉树")
	PrintTree(n1)

	/* 插入与删除节点 */
	// 插入节点
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("插入节点 P 后")
	PrintTree(n1)
	// 删除节点
	n1.Left = n2
	fmt.Println("删除节点 P 后")
	PrintTree(n1)
}
