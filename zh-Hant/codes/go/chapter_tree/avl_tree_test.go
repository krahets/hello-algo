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
	/* 初始化空 AVL 树 */
	tree := newAVLTree()
	/* 插入节点 */
	// 请关注插入节点后，AVL 树是如何保持平衡的
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

	/* 插入重复节点 */
	testInsert(tree, 7)

	/* 删除节点 */
	// 请关注删除节点后，AVL 树是如何保持平衡的
	testRemove(tree, 8) // 删除度为 0 的节点
	testRemove(tree, 5) // 删除度为 1 的节点
	testRemove(tree, 4) // 删除度为 2 的节点

	/* 查询节点 */
	node := tree.search(7)
	fmt.Printf("\n查找到的节点对象为 %#v ，节点值 = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\n插入节点 %d 后，AVL 树为 \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\n删除节点 %d 后，AVL 树为 \n", val)
	PrintTree(tree.root)
}
