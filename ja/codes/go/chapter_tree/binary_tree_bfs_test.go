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
	/* 二分木を初期化する */
	// ここでは配列から直接二分木を作る関数を使う
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\n二分木を初期化： ")
	PrintTree(root)

	// レベル順走査
	nums := levelOrder(root)
	fmt.Println("\nレベル順に出力したノードの列 = ", nums)
}
