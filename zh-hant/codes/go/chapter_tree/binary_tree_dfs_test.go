// File: binary_tree_dfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreInPostOrderTraversal(t *testing.T) {
	/* 初始化二元樹 */
	// 這裡使用能從陣列直接建立二元樹的函式
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二元樹： ")
	PrintTree(root)

	// 前序走訪
	nums = nil
	preOrder(root)
	fmt.Println("\n依前序走訪印出的節點序列 =", nums)

	// 中序走訪
	nums = nil
	inOrder(root)
	fmt.Println("\n依中序走訪印出的節點序列 =", nums)

	// 後序走訪
	nums = nil
	postOrder(root)
	fmt.Println("\n依後序走訪印出的節點序列 =", nums)
}
