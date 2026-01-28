// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL tree */
type aVLTree struct {
	// Root node
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* Get node height */
func (t *aVLTree) height(node *TreeNode) int {
	// Empty node height is -1, leaf node height is 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* Update node height */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// Node height equals the height of the tallest subtree + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* Get balance factor */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// Empty node balance factor is 0
	if node == nil {
		return 0
	}
	// Node balance factor = left subtree height - right subtree height
	return t.height(node.Left) - t.height(node.Right)
}

/* Right rotation operation */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// Using child as pivot, rotate node to the right
	child.Right = node
	node.Left = grandChild
	// Update node height
	t.updateHeight(node)
	t.updateHeight(child)
	// Return root node of subtree after rotation
	return child
}

/* Left rotation operation */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// Using child as pivot, rotate node to the left
	child.Left = node
	node.Right = grandChild
	// Update node height
	t.updateHeight(node)
	t.updateHeight(child)
	// Return root node of subtree after rotation
	return child
}

/* Perform rotation operation to restore balance to this subtree */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// Get balance factor of node
	// Go recommends short variables, here bf refers to t.balanceFactor
	bf := t.balanceFactor(node)
	// Left-leaning tree
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// Right rotation
			return t.rightRotate(node)
		} else {
			// First left rotation then right rotation
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// Right-leaning tree
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// Left rotation
			return t.leftRotate(node)
		} else {
			// First right rotation then left rotation
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// Balanced tree, no rotation needed, return directly
	return node
}

/* Insert node */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* Recursively insert node (helper function) */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. Find insertion position and insert node */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// Duplicate node not inserted, return directly
		return node
	}
	// Update node height
	t.updateHeight(node)
	/* 2. Perform rotation operation to restore balance to this subtree */
	node = t.rotate(node)
	// Return root node of subtree
	return node
}

/* Remove node */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* Recursively remove node (helper function) */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. Find node and delete */
	if val < node.Val.(int) {
		node.Left = t.removeHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.removeHelper(node.Right, val)
	} else {
		if node.Left == nil || node.Right == nil {
			child := node.Left
			if node.Right != nil {
				child = node.Right
			}
			if child == nil {
				// Number of child nodes = 0, delete node directly and return
				return nil
			} else {
				// Number of child nodes = 1, delete node directly
				node = child
			}
		} else {
			// Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// Update node height
	t.updateHeight(node)
	/* 2. Perform rotation operation to restore balance to this subtree */
	node = t.rotate(node)
	// Return root node of subtree
	return node
}

/* Search node */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// Loop search, exit after passing leaf node
	for cur != nil {
		if cur.Val.(int) < val {
			// Target node is in cur's right subtree
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// Target node is in cur's left subtree
			cur = cur.Left
		} else {
			// Found target node, exit loop
			break
		}
	}
	// Return target node
	return cur
}
