// File: binary_tree_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestBinaryTree(t *testing.T) {
	/* Initialize the binary tree */
	// Initialize the nodes
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// Set up references (pointers) between the nodes
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("Initialize the binary tree")
	PrintTree(n1)

	/* Insert and remove nodes */
	// Insert a node
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("After inserting node p")
	PrintTree(n1)
	// Remove a node
	n1.Left = n2
	fmt.Println("After removing node p")
	PrintTree(n1)
}
