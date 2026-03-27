// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* Построить двоичное дерево: разделяй и властвуй */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// Завершить при пустом диапазоне поддерева
	if r-l < 0 {
		return nil
	}
	// Инициализировать корневой узел
	root := NewTreeNode(preorder[i])
	// Найти m, чтобы разделить левое и правое поддеревья
	m := inorderMap[preorder[i]]
	// Подзадача: построить левое поддерево
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// Подзадача: построить правое поддерево
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// Вернуть корневой узел
	return root
}

/* Построить двоичное дерево */
func buildTree(preorder, inorder []int) *TreeNode {
	// Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
