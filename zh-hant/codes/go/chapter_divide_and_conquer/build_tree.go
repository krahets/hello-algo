// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* 建構二元樹：分治法 */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// 子樹區間為空時終止
	if r-l < 0 {
		return nil
	}
	// 初始化根節點
	root := NewTreeNode(preorder[i])
	// 查出 m，據此劃分左右子樹
	m := inorderMap[preorder[i]]
	// 子問題：建構左子樹
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// 子問題：建構右子樹
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// 回傳根節點
	return root
}

/* 建構二元樹 */
func buildTree(preorder, inorder []int) *TreeNode {
	// 初始化雜湊表，記錄 inorder 中各元素對應的索引
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
