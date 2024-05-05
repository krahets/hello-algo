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
	// Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\nThe initially set binary tree is:")
	bst.print()

	// Get the root node
	node := bst.getRoot()
	fmt.Println("\nThe root node of the binary tree is:", node.Val)

	// Search node
	node = bst.search(7)
	fmt.Println("The found node object is", node, ", value =", node.Val)

	// Insert node
	bst.insert(16)
	fmt.Println("\nAfter inserting node 16, the binary tree is:")
	bst.print()

	// Remove node
	bst.remove(1)
	fmt.Println("\nAfter removing node 1, the binary tree is:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nAfter removing node 2, the binary tree is:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nAfter removing node 4, the binary tree is:")
	bst.print()
}
