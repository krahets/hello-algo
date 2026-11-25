// File: preorder_traversal_iii_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Прямой обход: пример 3 */
func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
	// Отсечение
	if root == nil || root.Val == 3 {
		return
	}
	// Пробуем вариант
	*path = append(*path, root)
	if root.Val.(int) == 7 {
		// Сохраняем решение
		*res = append(*res, append([]*TreeNode{}, *path...))
	}
	preOrderIII(root.Left, res, path)
	preOrderIII(root.Right, res, path)
	// Возврат
	*path = (*path)[:len(*path)-1]
}
