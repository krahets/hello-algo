// File: binary_search_tree_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"
)

func TestBinarySearchTree(t *testing.T) {
	bst := newBinarySearchTree()
	nums := []int{8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15}
	// Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\nInitial binary tree:")
	bst.print()

	// Get the root node
	node := bst.getRoot()
	fmt.Println("\nRoot of the binary tree:", node.Val)

	// Find a node
	node = bst.search(7)
	fmt.Println("Found node:", node, ", node value =", node.Val)

	// Insert a node
	bst.insert(16)
	fmt.Println("\nBinary tree after inserting node 16:")
	bst.print()

	// Remove a node
	bst.remove(1)
	fmt.Println("\nBinary tree after removing node 1:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nBinary tree after removing node 2:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nBinary tree after removing node 4:")
	bst.print()
}
