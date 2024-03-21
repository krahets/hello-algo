// File: binary_search_tree_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"
)

func TestBinarySearchTree(t *testing.T) {
	bst := newBinarySearchTree()
	nums := []int{8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15}
	// 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
	for _, num := range nums {
		bst.insert(num)
	}
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
