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
	// Initialize empty tree
	bst.root = nil
	return bst
}

/* Get root node */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* Search node */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// Loop search, exit after passing leaf node
	for node != nil {
		if node.Val.(int) < num {
			// Target node is in cur's right subtree
			node = node.Right
		} else if node.Val.(int) > num {
			// Target node is in cur's left subtree
			node = node.Left
		} else {
			// Found target node, exit loop
			break
		}
	}
	// Return target node
	return node
}

/* Insert node */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// If tree is empty, initialize root node
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// Node position before the node to be inserted
	var pre *TreeNode = nil
	// Loop search, exit after passing leaf node
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
	// Insert node
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* Remove node */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// If tree is empty, return directly
	if cur == nil {
		return
	}
	// Node position before the node to be removed
	var pre *TreeNode = nil
	// Loop search, exit after passing leaf node
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// Node to be removed is in right subtree
			cur = cur.Right
		} else {
			// Node to be removed is in left subtree
			cur = cur.Left
		}
	}
	// If no node to delete, return directly
	if cur == nil {
		return
	}
	// Number of child nodes is 0 or 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// Get child node of node to be removed
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
			// If deleted node is root node, reassign root node
			bst.root = child
		}
		// Number of child nodes is 2
	} else {
		// Get next node of node cur to be removed in in-order traversal
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// Recursively delete node tmp
		bst.remove(tmp.Val.(int))
		// Replace cur with tmp
		cur.Val = tmp.Val
	}
}

/* Print binary search tree */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
