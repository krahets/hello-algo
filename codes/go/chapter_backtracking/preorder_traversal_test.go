// File: preorder_traversal_i_compact_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreorderTraversalICompact(t *testing.T) {
	/* 初始化二叉树 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二叉树")
	PrintTree(root)

	// 前序遍历
	res := make([]*TreeNode, 0)
	preOrderI(root, &res)

	fmt.Println("\n输出所有值为 7 的节点")
	for _, node := range res {
		fmt.Printf("%v ", node.Val)
	}
	fmt.Println()
}

func TestPreorderTraversalIICompact(t *testing.T) {
	/* 初始化二叉树 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二叉树")
	PrintTree(root)

	// 前序遍历
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderII(root, &res, &path)

	fmt.Println("\n输出所有根节点到节点 7 的路径")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIICompact(t *testing.T) {
	/* 初始化二叉树 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二叉树")
	PrintTree(root)

	// 前序遍历
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderIII(root, &res, &path)

	fmt.Println("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIITemplate(t *testing.T) {
	/* 初始化二叉树 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二叉树")
	PrintTree(root)

	// 回溯算法
	res := make([][]*TreeNode, 0)
	state := make([]*TreeNode, 0)
	choices := make([]*TreeNode, 0)
	choices = append(choices, root)
	backtrackIII(&state, &choices, &res)

	fmt.Println("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}
