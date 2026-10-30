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
	/* Initialize the binary tree */
	// Use a helper function that builds a binary tree directly from an array
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize the binary tree: ")
	PrintTree(root)

	// Preorder traversal
	nums = nil
	preOrder(root)
	fmt.Println("\nNode sequence from preorder traversal =", nums)

	// Inorder traversal
	nums = nil
	inOrder(root)
	fmt.Println("\nNode sequence from inorder traversal =", nums)

	// Postorder traversal
	nums = nil
	postOrder(root)
	fmt.Println("\nNode sequence from postorder traversal =", nums)
}
