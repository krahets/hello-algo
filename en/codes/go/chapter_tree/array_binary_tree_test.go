// File: array_binary_tree_test.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestArrayBinaryTree(t *testing.T) {
	// Initialize the binary tree
	// Use a helper function that builds a binary tree directly from an array
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nInitialize the binary tree")
	fmt.Println("Array representation of the binary tree:")
	fmt.Println(arr)
	fmt.Println("Linked representation of the binary tree:")
	PrintTree(root)

	// Binary tree type using an array representation
	abt := newArrayBinaryTree(arr)

	// Access a node
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nCurrent node index:", i, "with value", abt.val(i))
	fmt.Println("Left child index:", l, "with value", abt.val(l))
	fmt.Println("Right child index:", r, "with value", abt.val(r))
	fmt.Println("Parent index:", p, "with value", abt.val(p))

	// Traverse the tree
	res := abt.levelOrder()
	fmt.Println("\nLevel-order traversal:", res)
	res = abt.preOrder()
	fmt.Println("Preorder traversal:", res)
	res = abt.inOrder()
	fmt.Println("Inorder traversal:", res)
	res = abt.postOrder()
	fmt.Println("Postorder traversal:", res)
}
