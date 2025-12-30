// File: binary_tree_bfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* Initialize binary tree */
	// Here we use a function to generate a binary tree directly from an array
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree: ")
	PrintTree(root)

	// Level-order traversal
	nums := levelOrder(root)
	fmt.Println("\nLevel-order traversal node print sequence =", nums)
}
