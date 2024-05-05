// File: binary_tree_dfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreInPostOrderTraversal(t *testing.T) {
	/* Initialize binary tree */
	// Use a specific function to convert an array into a binary tree
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize the binary tree:")
	PrintTree(root)

	// Pre-order traversal
	nums = nil
	preOrder(root)
	fmt.Println("\nThe sequence of nodes in a pre-order traversal is:", nums)

	// In-order traversal
	nums = nil
	inOrder(root)
	fmt.Println("\nThe sequence of nodes in an in-order traversal is:", nums)

	// Post-order traversal
	nums = nil
	postOrder(root)
	fmt.Println("\nThe sequence of nodes in a post-order traversal is:", nums)
}
