// File: binary_tree_bfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* 初始化二叉树 */
	// 这里借助了一个从数组直接生成二叉树的函数
	root := ArrayToTree([]int{1, 2, 3, 4, 5, 6, 7})
	t.Log("初始化二叉树: ")
	PrintTree(root)

	// 层序遍历
	nums := levelOrder(root)
	t.Log("层序遍历的结点打印序列 =", nums)
}
