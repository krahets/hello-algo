// File: avl_tree_test.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestAVLTree(t *testing.T) {
	/* 空の AVL 木を初期化する */
	tree := newAVLTree()
	/* ノードを挿入する */
	// 挿入後に AVL 木がどのように平衡を保つかに注目
	testInsert(tree, 1)
	testInsert(tree, 2)
	testInsert(tree, 3)
	testInsert(tree, 4)
	testInsert(tree, 5)
	testInsert(tree, 8)
	testInsert(tree, 7)
	testInsert(tree, 9)
	testInsert(tree, 10)
	testInsert(tree, 6)

	/* 重複するノードを挿入する */
	testInsert(tree, 7)

	/* ノードを削除する */
	// 削除後に AVL 木がどのように平衡を保つかに注目
	testRemove(tree, 8) // 子が 0 個のノードを削除する
	testRemove(tree, 5) // 子が 1 個のノードを削除する
	testRemove(tree, 4) // 子が 2 個のノードを削除する

	/* ノードを検索する */
	node := tree.search(7)
	fmt.Printf("\n見つかったノードのオブジェクト：%#v、値 = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nノード %d を挿入した後の AVL 木：\n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nノード %d を削除した後の AVL 木：\n", val)
	PrintTree(tree.root)
}
