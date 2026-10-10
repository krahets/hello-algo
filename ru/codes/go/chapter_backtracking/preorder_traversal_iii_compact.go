// File: preorder_traversal_iii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Предварительный обход: пример 3 */
func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	// Отсечение
	if root == nil || root.Val == 3 {
		return
	}
	// Попытка
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// Записать решение
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderIII(root.Left, res, path)
	preOrderIII(root.Right, res, path)
	// Откат
	*path = (*path)[:len(*path)-1]
}
