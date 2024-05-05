// File: preorder_traversal_i_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Pre-order traversal: Example one */
func preOrderI(root *TreeNode, res *[]*TreeNode) {
	if root == nil {
		return
	}
	if (root.Val).(int) == 7 {
		// Record solution
		*res = append(*res, root)
	}
	preOrderI(root.Left, res)
	preOrderI(root.Right, res)
}
