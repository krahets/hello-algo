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
	/* Initialize binary tree */
	// Initialize nodes
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// Build references (pointers) between nodes
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("Initialize binary tree")
	PrintTree(n1)

	/* Insert node P between n1 -> n2 */
	// Insert node
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("After inserting node P")
	PrintTree(n1)
	// Remove node
	n1.Left = n2
	fmt.Println("After removing node P")
	PrintTree(n1)
}
