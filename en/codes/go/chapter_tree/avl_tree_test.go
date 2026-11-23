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
	/* Initialize an empty AVL tree */
	tree := newAVLTree()
	/* Insert a node */
	// Observe how the AVL tree maintains balance after a node is inserted
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

	/* Insert a duplicate node */
	testInsert(tree, 7)

	/* Remove a node */
	// Observe how the AVL tree maintains balance after a node is removed
	testRemove(tree, 8) // Remove a node with 0 children
	testRemove(tree, 5) // Remove a node with 1 child
	testRemove(tree, 4) // Remove a node with 2 children

	/* Look up a node */
	node := tree.search(7)
	fmt.Printf("\nFound node: %#v; node value = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nAVL tree after inserting node %d: \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nAVL tree after removing node %d: \n", val)
	PrintTree(tree.root)
}
