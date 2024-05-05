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
	/* Initialize empty AVL tree */
	tree := newAVLTree()
	/* Insert node */
	// Notice how the AVL tree maintains balance after inserting nodes
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

	/* Insert duplicate node */
	testInsert(tree, 7)

	/* Remove node */
	// Notice how the AVL tree maintains balance after removing nodes
	testRemove(tree, 8) // Remove node with degree 0
	testRemove(tree, 5) // Remove node with degree 1
	testRemove(tree, 4) // Remove node with degree 2

	/* Search node */
	node := tree.search(7)
	fmt.Printf("\nThe found node object is %#v, value = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nAfter inserting node %d, the AVL tree is \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nAfter removing node %d, the AVL tree is \n", val)
	PrintTree(tree.root)
}
