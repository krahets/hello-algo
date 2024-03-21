// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

var nums []any

/* 前序走訪 */
func preOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問優先順序：根節點 -> 左子樹 -> 右子樹
	nums = append(nums, node.Val)
	preOrder(node.Left)
	preOrder(node.Right)
}

/* 中序走訪 */
func inOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問優先順序：左子樹 -> 根節點 -> 右子樹
	inOrder(node.Left)
	nums = append(nums, node.Val)
	inOrder(node.Right)
}

/* 後序走訪 */
func postOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問優先順序：左子樹 -> 右子樹 -> 根節點
	postOrder(node.Left)
	postOrder(node.Right)
	nums = append(nums, node.Val)
}
