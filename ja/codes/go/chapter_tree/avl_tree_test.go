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
	/* ノードを挿入 */
	// ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

	/* 重複ノードを挿入する */
	testInsert(tree, 7)

	/* ノードを削除 */
	// ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
	testRemove(tree, 8) // 次数 0 のノードを削除する
	testRemove(tree, 5) // 次数 1 のノードを削除する
	testRemove(tree, 4) // 次数 2 のノードを削除する

	/* ノードを検索 */
	node := tree.search(7)
	fmt.Printf("\n見つかったノードオブジェクトは %#v ，ノードの値 = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nノード %d を挿入後、AVL 木は \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nノード %d を削除後、AVL 木は \n", val)
	PrintTree(tree.root)
}
