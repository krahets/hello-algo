// File: preorder_traversal_iii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 전위 순회: 예제 3 */
func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	// 가지치기
	if root == nil || root.Val == 3 {
		return
	}
	// 시도
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// 해를 기록한다
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderIII(root.Left, res, path)
	preOrderIII(root.Right, res, path)
	// 되돌리기
	*path = (*path)[:len(*path)-1]
}
