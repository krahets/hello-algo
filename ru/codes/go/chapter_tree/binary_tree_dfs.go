// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

var nums []any

/* Предварительный обход */
func preOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Порядок обхода: корень -> левое поддерево -> правое поддерево
	nums = append(nums, node.Val)
	preOrder(node.Left)
	preOrder(node.Right)
}

/* Симметричный обход */
func inOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Порядок обхода: левое поддерево -> корень -> правое поддерево
	inOrder(node.Left)
	nums = append(nums, node.Val)
	inOrder(node.Right)
}

/* Обратный обход */
func postOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Порядок обхода: левое поддерево -> правое поддерево -> корень
	postOrder(node.Left)
	postOrder(node.Right)
	nums = append(nums, node.Val)
}
