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
	// [region]{init_binary_tree}
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
	// [endregion]{init_binary_tree}
	fmt.Println("Initialize the binary tree")
	PrintTree(n1)

	// [region]{insert_node}
	/* Insert and remove nodes */
	// Insert node P between n1 and n2 in n1 -> n2
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	// [endregion]{insert_node}
	fmt.Println("After inserting node P")
	PrintTree(n1)
	// [region]{remove_node}
	// Remove node P
	n1.Left = n2
	// [endregion]{remove_node}
	fmt.Println("After removing node P")
	PrintTree(n1)
}
