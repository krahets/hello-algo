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
	/* 初始化空 AVL 樹 */
	tree := newAVLTree()
	/* 插入節點 */
	// 請關注插入節點後，AVL 樹是如何保持平衡的
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

	/* 插入重複節點 */
	testInsert(tree, 7)

	/* 刪除節點 */
	// 請關注刪除節點後，AVL 樹是如何保持平衡的
	testRemove(tree, 8) // 刪除度為 0 的節點
	testRemove(tree, 5) // 刪除度為 1 的節點
	testRemove(tree, 4) // 刪除度為 2 的節點

	/* 查詢節點 */
	node := tree.search(7)
	fmt.Printf("\n查詢到的節點物件為 %#v ，節點值 = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\n插入節點 %d 後，AVL 樹為 \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\n刪除節點 %d 後，AVL 樹為 \n", val)
	PrintTree(tree.root)
}
