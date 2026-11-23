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
	/* 二分木を初期化する */
	// ここでは配列から二分木を直接生成する関数を使う
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化する： ")
	PrintTree(root)

	// 行きがけ順走査
	nums = nil
	preOrder(root)
	fmt.Println("\n行きがけ順走査で表示するノードの順序 =", nums)

	// 通りがけ順走査
	nums = nil
	inOrder(root)
	fmt.Println("\n通りがけ順走査で表示するノードの順序 =", nums)

	// 帰りがけ順走査
	nums = nil
	postOrder(root)
	fmt.Println("\n帰りがけ順走査で表示するノードの順序 =", nums)
}
