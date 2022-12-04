// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* 层序遍历 */
func levelOrder(root *TreeNode) []int {
	// 初始化队列，加入根结点
	queue := list.New()
	queue.PushBack(root)
	// 初始化一个切片，用于保存遍历序列
	nums := make([]int, 0)
	for queue.Len() > 0 {
		// poll
		node := queue.Remove(queue.Front()).(*TreeNode)
		// 保存结点
		nums = append(nums, node.Val)
		if node.Left != nil {
			// 左子结点入队
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// 右子结点入队
			queue.PushBack(node.Right)
		}
	}
	return nums
}
