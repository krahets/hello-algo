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
	// Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\nInitialized binary tree is:")
	bst.print()

	// Get root node
	node := bst.getRoot()
	fmt.Println("\nRoot node of binary tree is:", node.Val)

	// Search node
	node = bst.search(7)
	fmt.Println("Found node object is", node, ", node value =", node.Val)

	// Insert node
	bst.insert(16)
	fmt.Println("\nAfter inserting node 16, binary tree is:")
	bst.print()

	// Remove node
	bst.remove(1)
	fmt.Println("\nAfter removing node 1, binary tree is:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nAfter removing node 2, binary tree is:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nAfter removing node 4, binary tree is:")
	bst.print()
}
