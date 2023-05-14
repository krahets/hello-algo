// File: preorder_traversal_i_compact.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

var res = make([]any, 0)

/* 前序遍历：例题一 */
func preOrder(root *TreeNode) {
	if root == nil {
		return
	}
	if int(root.Val) == 7 {
		// 记录解
		res = append(res, root.Val)
	}
	preOrder(root.Left)
	preOrder(root.Right)
}

func TestPreorderTraversalICompact(t *testing.T) {
	/* 初始化二叉树 */
	root := ArrToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二叉树")
	PrintTree(root)

	// 前序遍历
	preOrder(root)

	fmt.Println("\n输出所有值为 7 的节点")
	PrintSlice(res)
}
