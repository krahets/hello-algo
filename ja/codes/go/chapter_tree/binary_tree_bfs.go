// File: binary_tree_bfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"container/list"

	. "github.com/krahets/hello-algo/pkg"
)

/* レベル順走査 */
func levelOrder(root *TreeNode) []any {
	// キューを初期化して根を入れる
	queue := list.New()
	queue.PushBack(root)
	// 走査順を記録するスライスを初期化する
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// キューの先頭から取り出す
		node := queue.Remove(queue.Front()).(*TreeNode)
		// ノードの値を記録する
		nums = append(nums, node.Val)
		if node.Left != nil {
			// 左の子をキューに入れる
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// 右の子をキューに入れる
			queue.PushBack(node.Right)
		}
	}
	return nums
}
