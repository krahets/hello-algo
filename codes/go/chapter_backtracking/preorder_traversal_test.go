// File: preorder_traversal_i_compact_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* 初始化二叉树 */
	// 这里借助了一个从数组直接生成二叉树的函数
	root := ArrToTree([]any{1, 2, 3, 4, 5, 6, 7})
	PrintTree(root)
	preOrder(root)

	PrintSlice(res)

	fmt.Println("\n层序遍历的节点打印序列 =")
}
