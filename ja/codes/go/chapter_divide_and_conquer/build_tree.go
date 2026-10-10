// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* 二分木を構築：分割統治 */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// 部分木区間が空なら終了する
	if r-l < 0 {
		return nil
	}
	// ルートノードを初期化する
	root := NewTreeNode(preorder[i])
	// m を求めて左右部分木を分割する
	m := inorderMap[preorder[i]]
	// 部分問題：左部分木を構築する
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// 部分問題：右部分木を構築する
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// 根ノードを返す
	return root
}

/* 二分木を構築 */
func buildTree(preorder, inorder []int) *TreeNode {
	// inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
