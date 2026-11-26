// File: binary_search_tree.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

type binarySearchTree struct {
	root *TreeNode
}

func newBinarySearchTree() *binarySearchTree {
	bst := &binarySearchTree{}
	// Initialize an empty tree
	bst.root = nil
	return bst
}

/* Get the root */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Search for a node */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Stop the search after passing a leaf
	for node != nil {
		if node.Val.(int) < num {
			// The target is in the right subtree of cur
			node = node.Right
		} else if node.Val.(int) > num {
			// The target is in the left subtree of cur
			node = node.Left
		} else {
			// The target was found, so exit the loop
			break
		}
	}
	// Return the target node
	return node
}

/* Insert a node */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// If the tree is empty, initialize the root
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Track the parent of the node to insert
	var pre *TreeNode = nil
	// Stop the search after passing a leaf
	for cur != nil {
		if cur.Val == num {
			return
		}
		pre = cur
		if cur.Val.(int) < num {
			cur = cur.Right
		} else {
			cur = cur.Left
		}
	}
	// Insert a node
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* Delete a node */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// Return immediately if the tree is empty
	if cur == nil {
		return
	}
	// Track the parent of the node to delete
	var pre *TreeNode = nil
	// Stop the search after passing a leaf
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// The node to delete is in the right subtree
			cur = cur.Right
		} else {
			// The node to delete is in the left subtree
			cur = cur.Left
		}
	}
	// Return if the node to delete does not exist
	if cur == nil {
		return
	}
	// Zero or one child
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// Get the child of the node to delete
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// Delete node cur
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// If deleting the root, assign a new root
			bst.root = child
		}
		// Two children
	} else {
		// Get the inorder successor of the node cur to be deleted
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Recursively delete node tmp
		bst.remove(tmp.Val.(int))
		// Replace the value of cur with that of tmp
		cur.Val = tmp.Val
	}
}

/* Print the binary search tree */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
