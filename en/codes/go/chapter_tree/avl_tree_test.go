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
	// Watch how the AVL tree stays balanced after an insertion
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

	/* Delete a node */
	// Watch how the AVL tree stays balanced after a deletion
	testRemove(tree, 8) // Delete a node with no children
	testRemove(tree, 5) // Delete a node with one child
	testRemove(tree, 4) // Delete a node with two children

	/* Look up a node */
	node := tree.search(7)
	fmt.Printf("\nNode found: %#v, node value = %d\n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nAVL tree after inserting %d:\n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nAVL tree after deleting %d:\n", val)
	PrintTree(tree.root)
}
