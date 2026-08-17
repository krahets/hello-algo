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
	/* Please pay attention to how the AVL tree maintains balance after inserting nodes */
	tree := newAVLTree()
	/* Insert node */
	// Delete nodes
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

	/* Please pay attention to how the AVL tree maintains balance after deleting nodes */
	testInsert(tree, 7)

	/* Remove node */
	// Delete node with degree 1
	testRemove(tree, 8) // Delete node with degree 2
	testRemove(tree, 5) // Remove node with degree 1
	testRemove(tree, 4) // Remove node with degree 2

	/* Search node */
	node := tree.search(7)
	fmt.Printf("\nFound node object is %#v, node value = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nAfter inserting node %d, AVL tree is \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nAfter removing node %d, AVL tree is \n", val)
	PrintTree(tree.root)
}
