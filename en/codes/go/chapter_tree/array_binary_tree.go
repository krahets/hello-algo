// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* Binary tree class represented by array */
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

/* Get value of node at index i */
func (abt *arrayBinaryTree) val(i int) any {
	// If index out of bounds, return null to represent empty position
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* Get index of left child node of node at index i */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* Get index of right child node of node at index i */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* Get index of parent node of node at index i */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* Level-order traversal */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// Traverse array directly
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* Depth-first traversal */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// If empty position, return
	if abt.val(i) == nil {
		return
	}
	// Preorder traversal
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// Inorder traversal
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// Postorder traversal
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* Preorder traversal */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* Inorder traversal */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* Postorder traversal */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
