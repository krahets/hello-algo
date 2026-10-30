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
	/* Initialize the binary tree */
	// Use a helper function that builds a binary tree directly from an array
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize the binary tree: ")
	PrintTree(root)

	// Level-order traversal
	nums := levelOrder(root)
	fmt.Println("\nNode sequence from level-order traversal =", nums)
}
