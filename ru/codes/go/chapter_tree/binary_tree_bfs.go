// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* Обход по уровням */
func levelOrder(root *TreeNode) []any {
	// Инициализировать очередь и добавить корневой узел
	queue := list.New()
	queue.PushBack(root)
	// Инициализировать срез для сохранения последовательности обхода
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// Извлечение из очереди
		node := queue.Remove(queue.Front()).(*TreeNode)
		// Сохранить значение узла
		nums = append(nums, node.Val)
		if node.Left != nil {
			// Поместить левого потомка в очередь
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// Поместить правого потомка в очередь
			queue.PushBack(node.Right)
		}
	}
	return nums
}
