// File: preorder_traversal_i_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

var res = make([]any, 0)

/* 前序遍历：例题一 */
func preOrder(root *TreeNode) {
	if root == nil {
		return
	}
	if root.Val == 7 {
		// 记录解
		res = append(res, root.Val)
	}
	preOrder(root.Left)
	preOrder(root.Right)
}
