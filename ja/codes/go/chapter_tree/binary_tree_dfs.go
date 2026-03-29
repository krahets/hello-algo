// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

var nums []any

/* 先行順走査 */
func preOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問順序：根ノード -> 左部分木 -> 右部分木
	nums = append(nums, node.Val)
	preOrder(node.Left)
	preOrder(node.Right)
}

/* 中順走査 */
func inOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問優先順: 左部分木 -> 根ノード -> 右部分木
	inOrder(node.Left)
	nums = append(nums, node.Val)
	inOrder(node.Right)
}

/* 後順走査 */
func postOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
	postOrder(node.Left)
	postOrder(node.Right)
	nums = append(nums, node.Val)
}
