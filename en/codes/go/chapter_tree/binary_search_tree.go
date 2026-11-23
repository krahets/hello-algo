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

/* Get the root node */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Find a node */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Continue searching while the current node is not nil
	for node != nil {
		if node.Val.(int) < num {
			// If the target node exists, it lies in the right subtree of node
			node = node.Right
		} else if node.Val.(int) > num {
			// If the target node exists, it lies in the left subtree of node
			node = node.Left
		} else {
			// The target node was found; exit the loop
			break
		}
	}
	// Return the target node, or nil if it was not found
	return node
}

/* Insert a node */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// If the tree is empty, initialize the root node
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Track the parent of the node to insert
	var pre *TreeNode = nil
	// Continue searching while the current node is not nil
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

/* Remove a node */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// Return immediately if the tree is empty
	if cur == nil {
		return
	}
	// Track the parent of the node to remove
	var pre *TreeNode = nil
	// Continue searching while the current node is not nil
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// The node to remove is in the right subtree
			cur = cur.Right
		} else {
			// The node to remove is in the left subtree
			cur = cur.Left
		}
	}
	// Return immediately if the node to remove does not exist
	if cur == nil {
		return
	}
	// The node has 0 or 1 child
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// Get the child of the node to remove
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// Remove node cur
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// If the removed node is the root, assign the new root
			bst.root = child
		}
		// The node has 2 children
	} else {
		// Get the inorder successor of cur, the node to remove
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Recursively remove node tmp
		bst.remove(tmp.Val.(int))
		// Replace the value of cur with the value of tmp
		cur.Val = tmp.Val
	}
}

/* Print the binary search tree */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
