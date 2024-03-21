// File: preorder_traversal_i_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 前序走訪：例題一 */
func preOrderI(root *TreeNode, res *[]*TreeNode) {
	if root == nil {
		return
	}
	if (root.Val).(int) == 7 {
		// 記錄解
		*res = append(*res, root)
	}
	preOrderI(root.Left, res)
	preOrderI(root.Right, res)
}
