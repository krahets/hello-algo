// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* 構建二元樹：分治 */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// 子樹區間為空時終止
	if r-l < 0 {
		return nil
	}
	// 初始化根節點
	root := NewTreeNode(preorder[i])
	// 查詢 m ，從而劃分左右子樹
	m := inorderMap[preorder[i]]
	// 子問題：構建左子樹
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// 子問題：構建右子樹
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// 返回根節點
	return root
}

/* 構建二元樹 */
func buildTree(preorder, inorder []int) *TreeNode {
	// 初始化雜湊表，儲存 inorder 元素到索引的對映
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
