// File: binary_search_tree_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"
)

func TestBinarySearchTree(t *testing.T) {
	nums := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
	bst := newBinarySearchTree(nums)
	fmt.Println("\n初始化的二叉树为:")
	bst.print()

	// 获取根节点
	node := bst.getRoot()
	fmt.Println("\n二叉树的根节点为:", node.Val)

	// 查找节点
	node = bst.search(7)
	fmt.Println("查找到的节点对象为", node, "，节点值 =", node.Val)

	// 插入节点
	bst.insert(16)
	fmt.Println("\n插入节点后 16 的二叉树为:")
	bst.print()

	// 删除节点
	bst.remove(1)
	fmt.Println("\n删除节点 1 后的二叉树为:")
	bst.print()
	bst.remove(2)
	fmt.Println("\n删除节点 2 后的二叉树为:")
	bst.print()
	bst.remove(4)
	fmt.Println("\n删除节点 4 后的二叉树为:")
	bst.print()
}
