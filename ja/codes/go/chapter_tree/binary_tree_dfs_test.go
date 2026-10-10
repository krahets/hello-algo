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
	/* 二分木を初期化 */
	// ここでは、配列から直接二分木を生成する関数を利用する
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化: ")
	PrintTree(root)

	// 先行順走査
	nums = nil
	preOrder(root)
	fmt.Println("\n前順走査のノード出力シーケンス =", nums)

	// 中順走査
	nums = nil
	inOrder(root)
	fmt.Println("\n中順走査のノード出力シーケンス =", nums)

	// 後順走査
	nums = nil
	postOrder(root)
	fmt.Println("\n後順走査のノード出力シーケンス =", nums)
}
