// File: preorder_traversal_ii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 전위 순회: 예제 2 */
func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	if root == nil {
		return
	}
	// 시도
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// 해를 기록한다
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderII(root.Left, res, path)
	preOrderII(root.Right, res, path)
	// 되돌리기
	*path = (*path)[:len(*path)-1]
}
