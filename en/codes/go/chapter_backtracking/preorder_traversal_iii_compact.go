// File: preorder_traversal_iii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Pre-order traversal: Example three */
func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	// Pruning
	if root == nil || root.Val == 3 {
		return
	}
	// Attempt
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// Record solution
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderIII(root.Left, res, path)
	preOrderIII(root.Right, res, path)
	// Retract
	*path = (*path)[:len(*path)-1]
}
