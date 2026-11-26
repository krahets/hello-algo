// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* 二分木の構築：分割統治法 */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// 部分木の区間が空なら終了する
	if r-l < 0 {
		return nil
	}
	// 根ノードを初期化する
	root := NewTreeNode(preorder[i])
	// m を調べて左右の部分木を分ける
	m := inorderMap[preorder[i]]
	// 部分問題：左部分木を構築する
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// 部分問題：右部分木を構築する
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// 根ノードを返す
	return root
}

/* 二分木の構築 */
func buildTree(preorder, inorder []int) *TreeNode {
	// ハッシュ表を初期化し、inorder の各要素に対応するインデックスを格納する
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
