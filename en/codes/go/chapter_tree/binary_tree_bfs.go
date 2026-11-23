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
	// Initialize a queue and enqueue the root
	queue := list.New()
	queue.PushBack(root)
	// Initialize a slice to store the traversal sequence
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// Dequeue from the queue
		node := queue.Remove(queue.Front()).(*TreeNode)
		// Store the node value
		nums = append(nums, node.Val)
		if node.Left != nil {
			// Enqueue the left child
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// Enqueue the right child
			queue.PushBack(node.Right)
		}
	}
	return nums
}
