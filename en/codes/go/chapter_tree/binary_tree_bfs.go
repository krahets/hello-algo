// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* Level-order traversal */
func levelOrder(root *TreeNode) []any {
	// Initialize queue, add root node
	queue := list.New()
	queue.PushBack(root)
	// Initialize a slice to save traversal sequence
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// Dequeue
		node := queue.Remove(queue.Front()).(*TreeNode)
		// Save node value
		nums = append(nums, node.Val)
		if node.Left != nil {
			// Left child node enqueue
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// Right child node enqueue
			queue.PushBack(node.Right)
		}
	}
	return nums
}
