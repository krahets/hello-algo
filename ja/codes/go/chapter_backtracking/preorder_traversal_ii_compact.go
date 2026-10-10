// File: preorder_traversal_ii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 前順走査：例題 2 */
func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	if root == nil {
		return
	}
	// 試す
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// 解を記録
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderII(root.Left, res, path)
	preOrderII(root.Right, res, path)
	// バックトラック
	*path = (*path)[:len(*path)-1]
}
