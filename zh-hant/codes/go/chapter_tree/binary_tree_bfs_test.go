// File: binary_tree_bfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* 初始化二元樹 */
	// 這裡藉助了一個從陣列直接生成二元樹的函式
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n初始化二元樹: ")
	PrintTree(root)

	// 層序走訪
	nums := levelOrder(root)
	fmt.Println("\n層序走訪的節點列印序列 =", nums)
}
