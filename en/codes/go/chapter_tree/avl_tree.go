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

/* Get the node height */
func (t *aVLTree) height(node *TreeNode) int {
	// A nil node has height -1; a leaf has height 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* Update the node height */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// The node height equals the height of its taller subtree + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* Get the balance factor */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// A nil node has balance factor 0
	if node == nil {
		return 0
	}
	// Node balance factor = left subtree height - right subtree height
	return t.height(node.Left) - t.height(node.Right)
}

/* Right rotation */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// Rotate node to the right around child
	child.Right = node
	node.Left = grandChild
	// Update the node height
	t.updateHeight(node)
	t.updateHeight(child)
	// Return the root of the rotated subtree
	return child
}

/* Left rotation */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// Rotate node to the left around child
	child.Left = node
	node.Right = grandChild
	// Update the node height
	t.updateHeight(node)
	t.updateHeight(child)
	// Return the root of the rotated subtree
	return child
}

/* Perform rotations to restore balance in this subtree */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// Get the balance factor of node
	// Go favors short local variable names; bf holds the result of t.balanceFactor(node)
	bf := t.balanceFactor(node)
	// Left-heavy tree
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// Rotate right
			return t.rightRotate(node)
		} else {
			// Rotate left, then right
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// Right-heavy tree
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// Rotate left
			return t.leftRotate(node)
		} else {
			// Rotate right, then left
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// The tree is balanced; return without rotating
	return node
}

/* Insert a node */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* Insert a node recursively (helper function) */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. Find the insertion position and insert the node */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// Return without inserting a duplicate node
		return node
	}
	// Update the node height
	t.updateHeight(node)
	/* 2. Perform rotations to restore balance in this subtree */
	node = t.rotate(node)
	// Return the subtree root
	return node
}

/* Remove a node */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* Remove a node recursively (helper function) */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. Find and remove the node */
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
				// Number of children = 0: remove node and return
				return nil
			} else {
				// Number of children = 1: remove node directly
				node = child
			}
		} else {
			// Number of children = 2: remove the inorder successor and use its value to replace the current node value
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// Update the node height
	t.updateHeight(node)
	/* 2. Perform rotations to restore balance in this subtree */
	node = t.rotate(node)
	// Return the subtree root
	return node
}

/* Find a node */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// Continue searching while the current node is not nil
	for cur != nil {
		if cur.Val.(int) < val {
			// If the target node exists, it lies in the right subtree of cur
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// If the target node exists, it lies in the left subtree of cur
			cur = cur.Left
		} else {
			// The target node was found; exit the loop
			break
		}
	}
	// Return the target node, or nil if it was not found
	return cur
}
