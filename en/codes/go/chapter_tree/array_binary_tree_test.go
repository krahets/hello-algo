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
	// Initialize binary tree
	// Use a specific function to convert an array into a binary tree
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nInitialize binary tree")
	fmt.Println("Binary tree's array representation:")
	fmt.Println(arr)
	fmt.Println("Binary tree's linked list representation:")
	PrintTree(root)

	// Array-based binary tree class
	abt := newArrayBinaryTree(arr)

	// Access node
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nThe current node index is", i, ", value is", abt.val(i))
	fmt.Println("The left child node's index is", l, ", value is", abt.val(l))
	fmt.Println("The right child node's index is", r, ", value is", abt.val(r))
	fmt.Println("The parent node's index is", p, ", value is", abt.val(p))

	// Traverse tree
	res := abt.levelOrder()
	fmt.Println("\nLevel-order traversal is:", res)
	res = abt.preOrder()
	fmt.Println("Pre-order traversal is:", res)
	res = abt.inOrder()
	fmt.Println("In-order traversal is:", res)
	res = abt.postOrder()
	fmt.Println("Post-order traversal is:", res)
}
