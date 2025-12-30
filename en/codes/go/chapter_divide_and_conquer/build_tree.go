// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* Build binary tree: divide and conquer */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// Terminate when the subtree interval is empty
	if r-l < 0 {
		return nil
	}
	// Initialize the root node
	root := NewTreeNode(preorder[i])
	// Query m to divide the left and right subtrees
	m := inorderMap[preorder[i]]
	// Subproblem: build the left subtree
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// Subproblem: build the right subtree
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// Return the root node
	return root
}

/* Build binary tree */
func buildTree(preorder, inorder []int) *TreeNode {
	// Initialize hash map, storing the mapping from inorder elements to indices
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
