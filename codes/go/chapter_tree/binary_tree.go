// File: binary_tree.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

type BinaryTree struct {
	root *TreeNode
}

func NewBinaryTree(node *TreeNode) *BinaryTree {
	return &BinaryTree{
		root: node,
	}
}

func (tree *BinaryTree) Print() {
	PrintTree(tree.root)
}
