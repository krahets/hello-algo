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
	// [region]{init_binary_tree}
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
	// [endregion]{init_binary_tree}
	fmt.Println("初始化二叉树")
	PrintTree(n1)

	// [region]{insert_node}
	/* 插入与删除节点 */
	// 在 n1 -> n2 中间插入节点 P
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	// [endregion]{insert_node}
	fmt.Println("插入节点 P 后")
	PrintTree(n1)
	// [region]{remove_node}
	// 删除节点 P
	n1.Left = n2
	// [endregion]{remove_node}
	fmt.Println("删除节点 P 后")
	PrintTree(n1)
}
