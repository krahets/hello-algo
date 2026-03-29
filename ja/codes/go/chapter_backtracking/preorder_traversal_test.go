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
	/* 二分木を初期化 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化")
	PrintTree(root)

	// 先行順走査
	res := make([]*TreeNode, 0)
	preOrderI(root, &res)

	fmt.Println("\n値が 7 のノードをすべて出力")
	for _, node := range res {
		fmt.Printf("%v ", node.Val)
	}
	fmt.Println()
}

func TestPreorderTraversalIICompact(t *testing.T) {
	/* 二分木を初期化 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化")
	PrintTree(root)

	// 先行順走査
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderII(root, &res, &path)

	fmt.Println("\n根ノードからノード 7 までの経路をすべて出力")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIICompact(t *testing.T) {
	/* 二分木を初期化 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化")
	PrintTree(root)

	// 先行順走査
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderIII(root, &res, &path)

	fmt.Println("\n根ノードからノード 7 までの経路をすべて出力（経路に値が 3 のノードを含まない）")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIITemplate(t *testing.T) {
	/* 二分木を初期化 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化")
	PrintTree(root)

	// バックトラッキング法
	res := make([][]*TreeNode, 0)
	state := make([]*TreeNode, 0)
	choices := make([]*TreeNode, 0)
	choices = append(choices, root)
	backtrackIII(&state, &choices, &res)

	fmt.Println("\n根ノードからノード 7 までの経路をすべて出力（経路に値が 3 のノードを含まない）")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}
