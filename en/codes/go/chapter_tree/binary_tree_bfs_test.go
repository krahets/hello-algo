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
	// Use a specific function to convert an array into a binary tree
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize the binary tree:")
	PrintTree(root)

	// Level-order traversal
	nums := levelOrder(root)
	fmt.Println("\nThe sequence of nodes in a level-order traversal is:", nums)
}
