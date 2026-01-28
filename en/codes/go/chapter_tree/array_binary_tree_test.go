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
	// Here we use a function to generate a binary tree directly from an array
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\nInitialize binary tree")
	fmt.Println("Array representation of binary tree:")
	fmt.Println(arr)
	fmt.Println("Linked list representation of binary tree:")
	PrintTree(root)

	// Binary tree class represented by array
	abt := newArrayBinaryTree(arr)

	// Access node
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\nCurrent node index is", i, ", value is", abt.val(i))
	fmt.Println("Its left child node index is", l, ", value is", abt.val(l))
	fmt.Println("Its right child node index is", r, ", value is", abt.val(r))
	fmt.Println("Its parent node index is", p, ", value is", abt.val(p))

	// Traverse tree
	res := abt.levelOrder()
	fmt.Println("\nLevel-order traversal is:", res)
	res = abt.preOrder()
	fmt.Println("Preorder traversal is:", res)
	res = abt.inOrder()
	fmt.Println("Inorder traversal is:", res)
	res = abt.postOrder()
	fmt.Println("Postorder traversal is:", res)
}
