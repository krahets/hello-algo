// File: preorder_traversal_iii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 前順走査：例題 3 */
func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	// 枝刈り
	if root == nil || root.Val == 3 {
		return
	}
	// 試す
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// 解を記録
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderIII(root.Left, res, path)
	preOrderIII(root.Right, res, path)
	// バックトラック
	*path = (*path)[:len(*path)-1]
}
