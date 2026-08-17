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
	// Here we use a function to generate a binary tree directly from an array
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree: ")
	PrintTree(root)

	// Preorder traversal
	nums = nil
	preOrder(root)
	fmt.Println("\nPre-order traversal node print sequence =", nums)

	// Inorder traversal
	nums = nil
	inOrder(root)
	fmt.Println("\nIn-order traversal node print sequence =", nums)

	// Postorder traversal
	nums = nil
	postOrder(root)
	fmt.Println("\nPost-order traversal node print sequence =", nums)
}
