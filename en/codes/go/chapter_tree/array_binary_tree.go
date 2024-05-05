// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* Array-based binary tree class */
type arrayBinaryTree struct {
	tree []any
}

/* Constructor */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* List capacity */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* Get the value of the node at index i */
func (abt *arrayBinaryTree) val(i int) any {
	// If the index is out of bounds, return null, representing an empty spot
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* Get the index of the left child of the node at index i */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* Get the index of the right child of the node at index i */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* Get the index of the parent of the node at index i */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* Level-order traversal */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// Traverse array
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* Depth-first traversal */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// If it is an empty spot, return
	if abt.val(i) == nil {
		return
	}
	// Pre-order traversal
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// In-order traversal
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// Post-order traversal
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* Pre-order traversal */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* In-order traversal */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* Post-order traversal */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
