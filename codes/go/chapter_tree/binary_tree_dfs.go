// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

// preOrder 前序遍历
func preOrder(root *TreeNode) (nums []int) {
	var preOrderHelper func(node *TreeNode)
	// 匿名函数
	preOrderHelper = func(node *TreeNode) {
		if node == nil {
			return
		}
		// 访问优先级：根结点 -> 左子树 -> 右子树
		nums = append(nums, node.Val)
		preOrderHelper(node.Left)
		preOrderHelper(node.Right)
	}
	// 函数调用
	preOrderHelper(root)
	return
}

// inOrder 中序遍历
func inOrder(root *TreeNode) (nums []int) {
	var inOrderHelper func(node *TreeNode)
	// 匿名函数
	inOrderHelper = func(node *TreeNode) {
		if node == nil {
			return
		}
		// 访问优先级：左子树 -> 根结点 -> 右子树
		inOrderHelper(node.Left)
		nums = append(nums, node.Val)
		inOrderHelper(node.Right)
	}
	// 函数调用
	inOrderHelper(root)
	return
}

// postOrder 后序遍历
func postOrder(root *TreeNode) (nums []int) {
	var postOrderHelper func(node *TreeNode)
	// 匿名函数
	postOrderHelper = func(node *TreeNode) {
		if node == nil {
			return
		}
		// 访问优先级：左子树 -> 右子树 -> 根结点
		postOrderHelper(node.Left)
		postOrderHelper(node.Right)
		nums = append(nums, node.Val)
	}
	// 函数调用
	postOrderHelper(root)
	return
}
