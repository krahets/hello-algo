// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* 層序走訪 */
func levelOrder(root *TreeNode) []any {
	// 初始化佇列，加入根節點
	queue := list.New()
	queue.PushBack(root)
	// 初始化一個切片，用於儲存走訪序列
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// 隊列出隊
		node := queue.Remove(queue.Front()).(*TreeNode)
		// 儲存節點值
		nums = append(nums, node.Val)
		if node.Left != nil {
			// 左子節點入列
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// 右子節點入列
			queue.PushBack(node.Right)
		}
	}
	return nums
}
