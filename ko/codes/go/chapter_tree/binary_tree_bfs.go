// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* 레벨 순서 순회 */
func levelOrder(root *TreeNode) []any {
	// 큐를 초기화하고 루트 노드를 넣는다
	queue := list.New()
	queue.PushBack(root)
	// 순회 순서를 저장할 슬라이스를 초기화한다
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// 큐에서 꺼낸다
		node := queue.Remove(queue.Front()).(*TreeNode)
		// 노드 값을 저장한다
		nums = append(nums, node.Val)
		if node.Left != nil {
			// 왼쪽 자식 노드를 큐에 삽입한다
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// 오른쪽 자식 노드를 큐에 삽입한다
			queue.PushBack(node.Right)
		}
	}
	return nums
}
