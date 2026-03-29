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
	// キューを初期化し、ルートノードを追加する
	queue := list.New()
	queue.PushBack(root)
	// 走査順を保存するためのスライスを初期化する
	nums := make([]any, 0)
	for queue.Len() > 0 {
		// デキュー
		node := queue.Remove(queue.Front()).(*TreeNode)
		// ノードの値を保存する
		nums = append(nums, node.Val)
		if node.Left != nil {
			// 左子ノードをキューに追加
			queue.PushBack(node.Left)
		}
		if node.Right != nil {
			// 右子ノードをキューに追加
			queue.PushBack(node.Right)
		}
	}
	return nums
}
