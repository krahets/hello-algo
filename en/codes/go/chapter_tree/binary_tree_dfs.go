// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

var nums []any

/* Preorder traversal */
func preOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Visit priority: root node -> left subtree -> right subtree
	nums = append(nums, node.Val)
	preOrder(node.Left)
	preOrder(node.Right)
}

/* Inorder traversal */
func inOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Visit priority: left subtree -> root node -> right subtree
	inOrder(node.Left)
	nums = append(nums, node.Val)
	inOrder(node.Right)
}

/* Postorder traversal */
func postOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// Visit priority: left subtree -> right subtree -> root node
	postOrder(node.Left)
	postOrder(node.Right)
	nums = append(nums, node.Val)
}
