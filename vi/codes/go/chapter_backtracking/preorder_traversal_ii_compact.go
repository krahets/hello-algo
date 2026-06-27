// File: preorder_traversal_ii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Preorder traversal: Example 2 */
func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	if root == nil {
		return
	}
	// Attempt
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// Record solution
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderII(root.Left, res, path)
	preOrderII(root.Right, res, path)
	// Backtrack
	*path = (*path)[:len(*path)-1]
}
